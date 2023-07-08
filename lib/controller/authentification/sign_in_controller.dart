import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopy/core/constant/routes.dart';

abstract class SignInController extends GetxController {
  goToSignUp();
  goToForgotPassword();
  signIn();
  showPassword();
  signInwithGoogle();
  signInwithFacebook();
}

class SignInControllerImp extends SignInController {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  bool isShowPassword = true;
  late TextEditingController mailController;
  late TextEditingController passwordController;
  @override
  void onInit() {
    mailController = TextEditingController();
    passwordController = TextEditingController();
    super.onInit();
  }

  @override
  showPassword() {
    isShowPassword = isShowPassword == true ? false : true;
    update();
  }

  @override
  goToForgotPassword() {}

  @override
  goToSignUp() {
    Get.toNamed(AppRoute.signUp);
  }

  @override
  signIn() {
    if (formstate.currentState!.validate() == true) {
      print("okay");
    }
  }

  @override
  signInwithFacebook() {}

  @override
  signInwithGoogle() {}
}
