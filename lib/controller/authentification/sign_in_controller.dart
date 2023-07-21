import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopy/core/class/status_request.dart';
import 'package:shopy/core/constant/routes.dart';
import 'package:shopy/core/functions/get_snackbar.dart';
import 'package:shopy/core/functions/handle_data.dart';
import 'package:shopy/core/services/my_services.dart';
import 'package:shopy/data/remote/authentification/sign_in_data.dart';

abstract class SignInController extends GetxController {
  goToSignUp();
  goToForgotPassword();
  void signIn();
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
  SignInData signInData = SignInData(Get.find());
  StatusRequest statusRequest = StatusRequest.none;
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
  void signIn() async {
    if (formstate.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await signInData.postData(
          mailController.text, passwordController.text);
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response["jwt"] != null) {
          String token = response["jwt"];
          await myServices.sharedPreferences.setString("token", token);
          Get.offNamed(AppRoute.bottomNavigationBar);
        } else if (response["detail"] == "User not found") {
          getCustomSnackBar("88".tr, "90".tr, false);
          statusRequest = StatusRequest.failure;
        } else {
          getCustomSnackBar("89".tr, "91".tr, false);
          statusRequest = StatusRequest.failure;
        }
      } else {
        getCustomSnackBar("92".tr, "93".tr, false);
        statusRequest = StatusRequest.failure;
      }
      update();
    } else {}
  }

  @override
  signInWithFacebook() {}

  @override
  signInWithGoogle() {}
}
