import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopy/core/constant/app_size.dart';
import 'package:shopy/core/constant/color.dart';

class CustomPrimaryButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;
  final double? size;
  final bool? fontSize;
  final Color? color;
  const CustomPrimaryButton({
    super.key,
    required this.onPressed,
    required this.title,
    this.color,
    this.size,
    this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        padding: fontSize == null || fontSize == false
            ? const EdgeInsets.all(AppSize.buttonPadding)
            : const EdgeInsets.symmetric(
                vertical: AppSize.fs1,
                horizontal: AppSize.border,
              ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSize.borderRaduis),
        ),
        backgroundColor: color ?? AppColor.primaryColorBlue,
        minimumSize: size == null ? Size(Get.width, 0) : Size(size!, 0),
        textStyle: fontSize == null || fontSize == false
            ? Get.textTheme.headlineLarge
            : Get.textTheme.headlineSmall!.copyWith(
                color: AppColor.primaryColorWhite,
              ),
      ),
      child: Text(title),
    );
  }
}
