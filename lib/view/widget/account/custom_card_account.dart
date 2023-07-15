import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopy/core/constant/app_size.dart';
import 'package:shopy/core/constant/color.dart';
import 'package:shopy/view/widget/wishlist/custom_wishlist_button.dart';

class CustomcardAccount extends StatelessWidget {
  final String picture;
  final String name;
  final VoidCallback onTap;
  const CustomcardAccount({
    super.key,
    required this.picture,
    required this.name,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(AppSize.borderRaduis),
          child: Image.asset(
            picture,
            fit: BoxFit.cover,
            width: Get.width * 0.2,
            height: Get.height * 0.1,
          ),
        ),
        const SizedBox(width: AppSize.md),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: Get.textTheme.headlineLarge!.copyWith(
                color: AppColor.primaryColorGrey,
              ),
            ),
            const SizedBox(height: AppSize.fs2),
            CustomWishlistButton(
              name: "77".tr,
              onTap: onTap,
            ),
          ],
        ),
      ],
    );
  }
}
