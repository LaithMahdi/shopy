import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopy/core/constant/app_size.dart';
import 'package:shopy/core/constant/color.dart';

getCustomSnackBar(String title, String message, bool isSuccess) =>
    Get.showSnackbar(
      GetSnackBar(
        backgroundColor:
            isSuccess ? AppColor.primaryColorGreen : AppColor.primaryColorRed,
        title: title,
        duration: const Duration(seconds: 3),
        messageText: Text(
          message,
          style: Get.textTheme.headlineSmall!.copyWith(
            color: AppColor.primaryColorGrey1,
            fontWeight: FontWeight.w500,
          ),
        ),
        isDismissible: true,
        icon: Icon(
          isSuccess ? Icons.check_circle : Icons.dangerous,
          size: AppSize.paddingContentScreenMd,
          color: AppColor.primaryColorWhite,
        ),
        snackPosition: SnackPosition.TOP,
        margin: const EdgeInsets.all(AppSize.borderRaduis),
        borderRadius: AppSize.borderRaduis,
      ),
    );
