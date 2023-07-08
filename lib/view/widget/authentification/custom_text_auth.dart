import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomTextAuth extends StatelessWidget {
  final String title;
  final bool? semiBold;
  const CustomTextAuth({
    super.key,
    required this.title,
    this.semiBold,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: Get.textTheme.headlineMedium!.copyWith(
        fontWeight: semiBold == null || semiBold == false
            ? FontWeight.w500
            : FontWeight.w600,
      ),
    );
  }
}
