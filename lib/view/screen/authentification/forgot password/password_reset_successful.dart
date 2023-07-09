import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopy/core/constant/app_size.dart';
import 'package:shopy/core/constant/color.dart';
import 'package:shopy/view/screen/authentification/forgot%20password/password_reset_successful_controller.dart';
import 'package:shopy/view/widget/authentification/forgot_password/successful_message.dart';

import '../../../widget/authentification/custom_primary_button.dart';

class PasswordResetSuccessfulScreen extends StatelessWidget {
  const PasswordResetSuccessfulScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const Spacer(),
            const SuccessfulMessage(),
            const SizedBox(height: AppSize.borderRaduis),
            SizedBox(
              width: Get.width * 0.5,
              child: Text(
                "37".tr,
                textAlign: TextAlign.center,
                style: Get.textTheme.headlineLarge!.copyWith(
                  fontSize: AppSize.fs,
                  color: AppColor.primaryColorGrey,
                ),
              ),
            ),
            const SizedBox(height: AppSize.paddingBetween),
            SizedBox(
              width: Get.width * 0.7,
              child: Text(
                "38".tr,
                textAlign: TextAlign.center,
                style: Get.textTheme.headlineMedium!.copyWith(
                  fontWeight: FontWeight.w500,
                  color: AppColor.primaryColorGrey2,
                ),
              ),
            ),
            const Spacer(),
            Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSize.paddingContentScreen,
                ),
                child: GetBuilder<PasswordResetSuccessfulControllerImp>(
                  init: PasswordResetSuccessfulControllerImp(),
                  builder: (controller) => CustomPrimaryButton(
                    onPressed: () => controller.goToSignIn(),
                    title: "1".tr,
                  ),
                )),
            const SizedBox(height: AppSize.lg),
          ],
        ),
      ),
    );
  }
}
