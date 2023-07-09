import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopy/core/constant/app_size.dart';
import 'package:shopy/core/constant/color.dart';
import 'package:shopy/core/constant/routes.dart';

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
  showNewPassword() {
    isNewShowPassword = isNewShowPassword == true ? false : true;
    update();
  }

  @override
  updatePassword() {
    if (formstate.currentState!.validate() == true) {
      if (passwordController.text == newPasswordController.text) {
        Get.offAllNamed(AppRoute.passwordResetSuccessful);
      } else {
        Get.defaultDialog(
          title: "35".tr,
          content: Text(
            "36".tr,
            style: Get.textTheme.headlineMedium!.copyWith(
              fontWeight: FontWeight.w400,
            ),
          ),
          radius: AppSize.borderRaduis,
          titleStyle: Get.textTheme.headlineLarge!.copyWith(
            color: AppColor.primaryColorGrey,
          ),
          barrierDismissible: true,
          titlePadding: const EdgeInsets.all(AppSize.md),
          textConfirm: "28".tr,
          textCancel: "29".tr,
          onConfirm: () => Get.back(),
        );
      }
    }
  }
}
