import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopy/core/constant/app_size.dart';
import 'package:shopy/core/constant/color.dart';

class CustomWishlistButton extends StatelessWidget {
  final String name;
  final VoidCallback onTap;
  const CustomWishlistButton({
    super.key,
    required this.name,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: AppColor.primaryColorGrey1,
          border: Border.all(
            color: AppColor.primaryColorGrey2,
            width: 0.5,
          ),
          borderRadius: BorderRadius.circular(
            AppSize.paddingBetween,
          ),
        ),
        padding: const EdgeInsets.symmetric(
          vertical: AppSize.fs1,
          horizontal: AppSize.borderRaduis,
        ),
        child: Text(
          name,
          style: Get.textTheme.headlineSmall!.copyWith(
            color: AppColor.primaryColorGrey4,
          ),
        ),
      ),
    );
  }
}
