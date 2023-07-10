import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:shopy/core/constant/app_size.dart';
import 'package:shopy/core/constant/color.dart';

class CustomGenreImageAndText extends StatelessWidget {
  final String name;
  final String picture;
  const CustomGenreImageAndText({
    super.key,
    required this.name,
    required this.picture,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(
            vertical: AppSize.md,
            horizontal: AppSize.buttonPadding,
          ),
          decoration: BoxDecoration(
            color: AppColor.primaryColorBlue.withOpacity(0.2),
            borderRadius: BorderRadius.circular(
              AppSize.borderRaduis,
            ),
          ),
          child: SvgPicture.asset(
            picture,
            width: AppSize.paddingContentScreen,
            height: AppSize.paddingContentScreen,
            color: AppColor.primaryColorBlue,
          ),
        ),
        const SizedBox(height: AppSize.paddingBetween),
        Text(
          name,
          style: Get.textTheme.headlineSmall,
        )
      ],
    );
  }
}
