import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopy/core/constant/app_size.dart';
import 'package:shopy/core/constant/color.dart';

class CustomCounter extends StatelessWidget {
  final String counter;
  final VoidCallback onTapAdd;
  final VoidCallback onTapMinus;
  const CustomCounter({
    super.key,
    required this.counter,
    required this.onTapAdd,
    required this.onTapMinus,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: onTapMinus,
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
          width: Get.width * 0.1,
          height: Get.height * 0.05,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: Border.all(
              color: AppColor.primaryColorGrey,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(
              AppSize.fs2,
            ),
          ),
          child: Text(
            counter,
            style: Get.textTheme.headlineLarge!.copyWith(
              color: AppColor.primaryColorGrey,
            ),
          ),
        ),
        const SizedBox(width: AppSize.md),
        GestureDetector(
          onTap: onTapAdd,
          child: Text(
            "+",
            style: Get.textTheme.headlineLarge!.copyWith(
              fontWeight: FontWeight.bold,
              color: AppColor.primaryColorGrey,
            ),
          ),
        ),
      ],
    );
  }
}
