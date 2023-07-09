import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopy/core/constant/app_size.dart';
import 'package:shopy/core/constant/color.dart';
import 'package:shopy/core/constant/routes.dart';

abstract class RecoveryCodeController extends GetxController {
  goToNextNewPassword(String code);
  bool compareTo(String code);
  sendAgain();
}

class RecoveryCodeControllerImp extends RecoveryCodeController {
  late String verificationCode;
  @override
  void onInit() {
    // TODO: implement onInit
    verificationCode = "4444";
    super.onInit();
  }

  @override
  bool compareTo(String code) {
    return code == verificationCode ? true : false;
  }

  @override
  goToNextNewPassword(String code) {
    bool result = compareTo(code);
    if (result) {
      Get.offNamed(AppRoute.newPassword);
    } else {
      Get.defaultDialog(
        title: "26".tr,
        content: Text(
          "27".tr,
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

  @override
  sendAgain() {}
}
