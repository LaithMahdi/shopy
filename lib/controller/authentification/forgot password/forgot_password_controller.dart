import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopy/core/class/status_request.dart';
import 'package:shopy/core/constant/routes.dart';
import 'package:shopy/core/functions/get_snackbar.dart';
import 'package:shopy/core/functions/handle_data.dart';
import 'package:shopy/data/remote/authentification/forgot%20password/send_verify_code.dart';

abstract class ForgotPasswordController extends GetxController {
  void goToRecoveryCodeScreen();
}

class ForgotPasswordControllerImp extends ForgotPasswordController {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  late TextEditingController emailController;
  StatusRequest? statusRequest;
  SendVerifyCode sendVerifyCode = SendVerifyCode(Get.find());
  @override
  void onInit() {
    // TODO: implement onInit
    emailController = TextEditingController();
    super.onInit();
  }

  @override
  void goToRecoveryCodeScreen() async {
    if (formstate.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await sendVerifyCode.postData(emailController.text);

      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        print(response);
        if (response["message"] != null) {
          getCustomSnackBar("23".tr, "97".tr, true);
          Get.offNamed(AppRoute.recoveryCode, arguments: {
            "email": emailController.text,
          });
        } else if (response["error"] == "User not found.") {
          getCustomSnackBar("88".tr, "90".tr, false);
          statusRequest = StatusRequest.failure;
        }
      } else {
        statusRequest = StatusRequest.failure;
      }
      update();
    } else {}
  }
}
