import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:shopy/core/constant/app_size.dart';
import 'package:shopy/core/constant/color.dart';
import 'package:shopy/core/constant/image_asset.dart';
import 'package:shopy/core/constant/routes.dart';
import 'package:shopy/view/widget/authentification/custom_primary_button.dart';

class OrderSuccessScreen extends StatelessWidget {
  const OrderSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(
            horizontal: AppSize.paddingContentScreen),
        width: Get.width,
        child: Column(
          children: [
            const Spacer(),
            LottieBuilder.asset(
              AppImageAsset.lottieSuccess,
            ),
            Text(
              "45".tr,
              style: Get.textTheme.headlineLarge!
                  .copyWith(fontSize: 18, color: AppColor.primaryColorGrey),
            ),
            const SizedBox(height: AppSize.fs),
            Text(
              "46".tr,
              textAlign: TextAlign.center,
              style: Get.textTheme.headlineMedium!.copyWith(
                color: AppColor.primaryColorGrey4,
                fontWeight: FontWeight.w500,
              ),
            ),
            const Spacer(),
            CustomPrimaryButton(
                onPressed: () {
                  Get.offNamed(AppRoute.bottomNavigationBar);
                },
                title: "57".tr),
            const SizedBox(height: AppSize.lg),
          ],
        ),
      ),
    );
  }
}
