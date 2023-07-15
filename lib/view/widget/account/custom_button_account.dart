import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopy/core/constant/app_size.dart';
import 'package:shopy/core/constant/color.dart';

class CustomButtonAccount extends StatelessWidget {
  final String name;
  final VoidCallback onTap;
  const CustomButtonAccount({
    super.key,
    required this.name,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: AppSize.buttonPadding),
          Text(name, style: Get.textTheme.headlineMedium),
          const SizedBox(height: AppSize.buttonPadding),
          const Divider(color: AppColor.primaryColorGrey2, thickness: 2),
        ],
      ),
    );
  }
}
