import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:shopy/controller/onboarding/onboarding_controller.dart';
import 'package:shopy/core/constant/app_size.dart';
import 'package:shopy/core/constant/color.dart';
import 'package:shopy/core/constant/image_asset.dart';
import 'package:shopy/view/widget/authentification/custom_primary_button.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => OnboardingControllerImp());
    return Scaffold(
      backgroundColor: AppColor.primaryColorGrey1,
      body: Container(
        width: Get.width,
        padding: const EdgeInsets.symmetric(
          horizontal: AppSize.paddingContentScreen,
        ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          const Spacer(flex: 2),
          SvgPicture.asset(
            AppImageAsset.logo,
            color: AppColor.primaryColorBlue,
          ),
          const SizedBox(height: AppSize.paddingBetween),
          Text(
            "Shopy",
            style: Get.textTheme.displayLarge!.copyWith(
              fontWeight: FontWeight.w500,
              letterSpacing: AppSize.paddingBetween,
            ),
          ),
          const Spacer(),
          Text(
            "18".tr,
            style: Get.textTheme.headlineLarge!.copyWith(
              color: AppColor.primaryColorGrey,
            ),
          ),
          const SizedBox(height: AppSize.md),
          GetBuilder<OnboardingControllerImp>(
            builder: (controller) => CustomPrimaryButton(
              onPressed: () => controller.changeLanguageToEnglish(),
              title: "20".tr,
            ),
          ),
          const SizedBox(height: AppSize.paddingBetween),
          GetBuilder<OnboardingControllerImp>(
            builder: (controller) => CustomPrimaryButton(
              onPressed: () => controller.changeLanguageToArabic(),
              title: "19".tr,
            ),
          ),
          const SizedBox(height: AppSize.xlg)
        ]),
      ),
    );
  }
}
