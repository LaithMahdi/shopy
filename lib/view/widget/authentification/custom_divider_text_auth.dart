import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopy/core/constant/app_size.dart';
import 'package:shopy/core/constant/color.dart';

class CustomDividerTextAuth extends StatelessWidget {
  final String title;
  const CustomDividerTextAuth({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Expanded(
          child: Divider(
            color: AppColor.primaryColorGrey2,
            thickness: 1,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSize.paddingBetween,
          ),
          child: Text(
            title,
            style: Get.textTheme.headlineMedium,
          ),
        ),
        const Expanded(
          child: Divider(
            color: AppColor.primaryColorGrey2,
            thickness: 1,
          ),
        ),
      ],
    );
  }
}
