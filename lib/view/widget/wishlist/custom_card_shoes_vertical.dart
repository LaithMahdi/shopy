import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopy/core/constant/app_size.dart';
import 'package:shopy/core/constant/color.dart';

class CustomCardShoesVertical extends StatelessWidget {
  final String picture;
  final String name;
  final double prise;
  const CustomCardShoesVertical(
      {super.key,
      required this.picture,
      required this.name,
      required this.prise});

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
            child: Image.asset(
              picture,
              width: Get.width * 0.35,
              height: Get.height * 0.2,
            ),
          ),
          const SizedBox(width: AppSize.borderRaduis),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: Get.textTheme.headlineMedium,
              ),
              const SizedBox(height: AppSize.fs2),
              Text(
                "\$$prise",
                style: Get.textTheme.headlineMedium!.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: AppSize.borderRaduis),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: Text(
                      "-",
                      style: Get.textTheme.headlineLarge!.copyWith(
                        fontWeight: FontWeight.bold,
                        color: AppColor.primaryColorGrey,
                      ),
                    ),
                  ),
                  const SizedBox(width: AppSize.md),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: AppSize.fs2,
                      horizontal: AppSize.fs1,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: AppColor.primaryColorGrey2,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(
                        AppSize.fs2,
                      ),
                    ),
                    child: Text(
                      "1",
                      style: Get.textTheme.headlineLarge!.copyWith(
                        color: AppColor.primaryColorGrey,
                      ),
                    ),
                  ),
                  const SizedBox(width: AppSize.md),
                  GestureDetector(
                    onTap: () {},
                    child: Text(
                      "+",
                      style: Get.textTheme.headlineLarge!.copyWith(
                        fontWeight: FontWeight.bold,
                        color: AppColor.primaryColorGrey,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
