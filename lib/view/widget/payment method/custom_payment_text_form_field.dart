import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopy/core/constant/app_size.dart';
import 'package:shopy/core/constant/color.dart';

class CustomPaymentTextFormField extends StatelessWidget {
  final String labelText;
  final TextEditingController controller;
  const CustomPaymentTextFormField({
    super.key,
    required this.labelText,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      style: Get.textTheme.headlineMedium!.copyWith(
        color: AppColor.primaryColorBlack,
        fontWeight: FontWeight.w500,
      ),
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: Get.textTheme.headlineMedium!.copyWith(
          fontSize: 16,
        ),
        filled: true,
        fillColor: AppColor.primaryColorGrey1,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSize.borderRaduis),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSize.borderRaduis),
          borderSide: const BorderSide(
            color: AppColor.primaryColorGrey2,
          ),
        ),
        floatingLabelBehavior: FloatingLabelBehavior.auto,
      ),
    );
  }
}
