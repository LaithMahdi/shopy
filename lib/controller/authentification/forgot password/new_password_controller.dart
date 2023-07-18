import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopy/core/class/status_request.dart';
import 'package:shopy/core/constant/routes.dart';
import 'package:shopy/core/functions/get_snackbar.dart';
import 'package:shopy/core/functions/handle_data.dart';
import 'package:shopy/data/remote/authentification/forgot%20password/rest_password_data.dart';

abstract class NewPasswordController extends GetxController {
  showPassword();
  showNewPassword();
  updatePassword();
}

class NewPasswordControllerImp extends NewPasswordController {
  late TextEditingController passwordController;
  late TextEditingController newPasswordController;
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  bool isShowPassword = true;
  bool isNewShowPassword = true;
  StatusRequest? statusRequest;
  RestPasswordData restPasswordData = RestPasswordData(Get.find());
  late String email;

  @override
  void onInit() {
    // TODO: implement onInit
    email = Get.arguments["email"];
    passwordController = TextEditingController();
    newPasswordController = TextEditingController();
    super.onInit();
  }

  @override
  showPassword() {
    isShowPassword = isShowPassword == true ? false : true;
    update();
  }

  @override
  showNewPassword() {
    isNewShowPassword = isNewShowPassword == true ? false : true;
    update();
  }

  @override
  updatePassword() async {
    if (formstate.currentState!.validate() == true) {
      if (passwordController.text == newPasswordController.text) {
        statusRequest = StatusRequest.loading;
        update();
        var response =
            await restPasswordData.postData(email, newPasswordController.text);

        statusRequest = handlingData(response);
        if (StatusRequest.success == statusRequest) {
          print(response);
          if (response["message"] != null) {
            Get.offAllNamed(AppRoute.passwordResetSuccessful);
          }
        } else {
          statusRequest = StatusRequest.failure;
        }
        update();
      } else {
        getCustomSnackBar("35".tr, "36".tr, false);
      }
    }
  }
}
