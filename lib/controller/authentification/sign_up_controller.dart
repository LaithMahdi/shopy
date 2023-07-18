import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopy/core/class/status_request.dart';
import 'package:shopy/core/functions/get_snackbar.dart';
import 'package:shopy/core/functions/handle_data.dart';
import 'package:shopy/data/remote/authentification/sign_up_data.dart';

abstract class SignUpController extends GetxController {
  void signUp();
  showPassword();
}

class SignUpControllerImp extends SignUpController {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  bool isShowPassword = true;

  late TextEditingController nameController;
  late TextEditingController mailController;
  late TextEditingController passwordController;
  StatusRequest? statusRequest;
  SignUpData signUpData = SignUpData(Get.find());
  @override
  void onInit() {
    nameController = TextEditingController();
    mailController = TextEditingController();
    passwordController = TextEditingController();
    super.onInit();
  }

  @override
  void signUp() async {
    if (formstate.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await signUpData.postData(
          nameController.text, mailController.text, passwordController.text);

      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response != null && response["message"] != null) {
          getCustomSnackBar("96".tr, "97".tr, true);
        } else if (response["email"][0] ==
            "user with this email already exists.") {
          getCustomSnackBar("94".tr, "95".tr, false);
          statusRequest = StatusRequest.failure;
        }
      } else {
        statusRequest = StatusRequest.failure;
      }
      update();
    } else {}
  }

  @override
  showPassword() {
    isShowPassword = isShowPassword == true ? false : true;
    update();
  }
}
