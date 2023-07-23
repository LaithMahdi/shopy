import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopy/core/constant/app_size.dart';
import 'package:shopy/core/constant/color.dart';

import 'custom_counter.dart';

class CustomCardShoesVertical extends StatelessWidget {
  final String picture;
  final String name;
  final double prise;
  const CustomCardShoesVertical({
    super.key,
    required this.picture,
    required this.name,
    required this.prise,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppSize.paddingBetween),
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColor.primaryColorGrey2,
          width: 0.5,
        ),
        borderRadius: BorderRadius.circular(AppSize.borderRaduis),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(
              AppSize.paddingBetween,
            ),
            child: Image.network(
              picture,
              width: Get.width * 0.35,
              height: Get.height * 0.2,
            ),
          ),
          const SizedBox(width: AppSize.borderRaduis),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  overflow: TextOverflow.ellipsis,
                  style: Get.textTheme.headlineMedium,
                ),
                const SizedBox(height: AppSize.fs2),
                Text(
                  "\$$prise",
                  style: Get.textTheme.headlineMedium!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: AppSize.fs2),
                CustomCounter(
                  counter: "1",
                  onTapAdd: () {},
                  onTapMinus: () {},
                ),
                const SizedBox(height: AppSize.borderRaduis),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
