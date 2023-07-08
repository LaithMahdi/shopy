import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopy/core/constant/routes.dart';

abstract class SignInController extends GetxController {
  goToSignUp();
  goToForgotPassword();
  signIn();
  showPassword();
  signInWithGoogle();
  signInWithFacebook();
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
  void dispose() {
    // TODO: implement dispose
    mailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  showPassword() {
    isShowPassword = isShowPassword == true ? false : true;
    update();
  }

  @override
  goToForgotPassword() => Get.toNamed(AppRoute.forgotPassword);

  @override
  goToSignUp() => Get.toNamed(AppRoute.signUp);

  @override
  signIn() {
    if (formstate.currentState!.validate() == true) {
      print("okay");
    }
  }

  @override
  signInWithFacebook() {}

  @override
  signInWithGoogle() {}
}
