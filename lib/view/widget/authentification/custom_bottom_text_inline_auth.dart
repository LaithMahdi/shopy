import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopy/core/constant/app_size.dart';

class CustomBottomTextInline extends StatelessWidget {
  final String firstTitle;
  final String secondTitle;
  final VoidCallback onTap;
  const CustomBottomTextInline({
    super.key,
    required this.firstTitle,
    required this.secondTitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          firstTitle,
          style: Get.textTheme.headlineMedium!.copyWith(
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(width: AppSize.textHeightSm),
        GestureDetector(
          onTap: onTap,
          child: Text(
            secondTitle,
            style: Get.textTheme.headlineMedium!.copyWith(),
          ),
        ),
      ],
    );
  }
}
