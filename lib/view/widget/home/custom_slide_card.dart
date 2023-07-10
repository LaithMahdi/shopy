import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopy/core/constant/app_size.dart';
import 'package:shopy/core/constant/color.dart';

class CustomSlideCard extends StatelessWidget {
  final String picture;
  final String genre;
  final String name;
  final VoidCallback onPressed;
  const CustomSlideCard({
    super.key,
    required this.picture,
    required this.genre,
    required this.name,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColor.primaryColorWhite,
      margin: const EdgeInsets.symmetric(
        horizontal: AppSize.paddingContentScreen,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSize.fs),
      ),
      elevation: AppSize.md,
      shadowColor: AppColor.primaryColorGrey.withOpacity(0.1),
      child: Container(
        height: Get.height * 0.2,
        padding: const EdgeInsets.all(AppSize.borderRaduis),
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
              AppSize.paddingBetween,
            )),
            child: Image.asset(picture),
          ),
          const SizedBox(width: AppSize.md),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(genre, style: Get.textTheme.headlineSmall),
              Text(
                name,
                style: Get.textTheme.headlineMedium!.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: AppSize.paddingBetween),
              ElevatedButton(
                onPressed: onPressed,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColor.primaryColorGrey,
                ),
                child: Text(
                  "42".tr,
                  style: Get.textTheme.headlineSmall!.copyWith(
                    color: AppColor.primaryColorWhite,
                  ),
                ),
              ),
            ],
          )
        ]),
      ),
    );
  }
}
