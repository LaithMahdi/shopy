import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopy/core/constant/app_size.dart';

class CustomPrimaryButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;
  final double? size;
  const CustomPrimaryButton({
    super.key,
    required this.onPressed,
    required this.title,
    this.size,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.all(AppSize.buttonPadding),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSize.borderRaduis),
        ),
        minimumSize: size == null ? Size(Get.width, 0) : Size(size!, 0),
        textStyle: Get.textTheme.headlineLarge,
      ),
      child: Text(title),
    );
  }
}
