import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopy/core/constant/app_size.dart';
import 'package:shopy/core/constant/color.dart';

class CustomTextFormField extends StatelessWidget {
  final String hintText;
  final TextInputType keyboardType;
  final IconData icon;
  final TextEditingController controller;
  final bool? obscureText;
  final VoidCallback? onTapShowEye;
  final String? Function(String? valid)? validator;
  const CustomTextFormField({
    super.key,
    required this.hintText,
    required this.keyboardType,
    required this.icon,
    required this.controller,
    required this.validator,
    this.obscureText,
    this.onTapShowEye,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType,
      validator: validator,
      controller: controller,
      obscureText: obscureText == null || obscureText == false ? false : true,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(
            horizontal: AppSize.md, vertical: AppSize.lg),
        filled: true,
        fillColor: AppColor.primaryColorGrey1,
        hintText: hintText,
        hintStyle: Get.textTheme.headlineMedium!.copyWith(
          color: AppColor.primaryColorGrey2,
          fontWeight: FontWeight.w500,
        ),
        suffixIcon: GestureDetector(
          onTap: onTapShowEye,
          child: Icon(icon),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSize.borderRaduis),
          borderSide: const BorderSide(
            color: AppColor.primaryColorGrey2,
            strokeAlign: BorderSide.strokeAlignCenter,
            style: BorderStyle.solid,
          ),
        ),
      ),
    );
  }
}