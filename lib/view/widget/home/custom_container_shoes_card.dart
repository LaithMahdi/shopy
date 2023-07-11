import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopy/core/constant/app_size.dart';
import 'package:shopy/core/constant/color.dart';

class CustomContainerShoesCard extends StatelessWidget {
  final String picture;
  final String name;
  final double prise;
  final String nbColor;
  final bool? isTapFavorite;
  final VoidCallback onTapFavorite;
  final VoidCallback onTapAdd;
  const CustomContainerShoesCard({
    super.key,
    required this.picture,
    required this.name,
    required this.prise,
    required this.nbColor,
    required this.onTapFavorite,
    required this.onTapAdd,
    this.isTapFavorite,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(AppSize.borderRaduis),
        ),
        color: AppColor.primaryColorWhite1,
      ),
      width: Get.width * 0.45,
      padding: const EdgeInsets.all(AppSize.paddingBetween),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(AppSize.borderRaduis),
              child: Image.asset(
                picture,
                width: Get.width * 0.4,
                height: Get.height * 0.18,
                fit: BoxFit.fill,
              ),
            ),
            Positioned(
              right: AppSize.borderRaduis,
              top: AppSize.borderRaduis,
              child: GestureDetector(
                onTap: onTapFavorite,
                child: Icon(
                  isTapFavorite == null || isTapFavorite == false
                      ? Icons.favorite_border
                      : Icons.favorite,
                  color: AppColor.primaryColorGrey,
                  size: AppSize.lg,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: AppSize.paddingBetween),
        Text(
          name,
          style: Get.textTheme.headlineMedium,
        ),
        Container(
          padding: const EdgeInsets.all(AppSize.fs1),
          margin: const EdgeInsets.only(
            top: AppSize.textHeightSm,
          ),
          decoration: BoxDecoration(
            color: AppColor.primaryColorGrey2,
            borderRadius: BorderRadius.circular(4),
          ),
          child: Text(
            nbColor,
            style: Get.textTheme.headlineSmall!.copyWith(
              color: AppColor.primaryColorWhite,
              fontSize: 9,
            ),
          ),
        ),
        const SizedBox(height: AppSize.fs1),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "\$$prise",
              style: Get.textTheme.headlineMedium!.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            InkWell(
              onTap: onTapAdd,
              child: const Icon(
                Icons.add,
                size: AppSize.md,
                color: AppColor.primaryColorGrey,
              ),
            )
          ],
        )
      ]),
    );
  }
}
