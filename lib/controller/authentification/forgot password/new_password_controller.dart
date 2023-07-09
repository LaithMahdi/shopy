import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopy/core/constant/routes.dart';

abstract class NewPasswordController extends GetxController {
  showPassword();
  updatePassword();
}

class NewPasswordControllerImp extends NewPasswordController {
  late TextEditingController passwordController;
  late TextEditingController newPasswordController;
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  bool isShowPassword = true;
  bool isNewShowPassword = true;

  @override
  void onInit() {
    // TODO: implement onInit
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
  updatePassword() {
    if (formstate.currentState!.validate() == true &&
        passwordController.text == newPasswordController.text) {
      Get.offAllNamed(AppRoute.passwordResetSuccessful);
    } else {
      Get.defaultDialog();
    }
  }
}
