import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopy/core/constant/routes.dart';
import 'package:shopy/core/services/my_services.dart';
import 'package:shopy/data/datasource/static/users_account.dart';

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
  MyServices myServices = Get.find();
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
  signIn() async {
    if (formstate.currentState!.validate() == true) {
      for (var element in usersAccount) {
        if (element.mail == mailController.text &&
            element.password == passwordController.text) {
          await myServices.sharedPreferences.setBool("isLogin", true);
          Get.offAllNamed(AppRoute.bottomNavigationBar);
        } else {
          print("error");
        }
      }
    }
  }

  @override
  signInWithFacebook() {}

  @override
  signInWithGoogle() {}
}
