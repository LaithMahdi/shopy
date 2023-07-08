import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomTextAuth extends StatelessWidget {
  final String title;
  const CustomTextAuth({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: Get.textTheme.headlineMedium!.copyWith(
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
