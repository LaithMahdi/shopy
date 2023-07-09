import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:shopy/controller/authentification/forgot%20password/recovery_code_controller.dart';
import 'package:shopy/core/constant/app_size.dart';
import 'package:shopy/core/constant/color.dart';
import 'package:shopy/view/widget/authentification/custom_primary_button.dart';
import 'package:shopy/view/widget/authentification/custom_text_top_auth.dart';
import 'package:shopy/view/widget/back_button.dart';

class RecoveryCodeScreen extends StatelessWidget {
  const RecoveryCodeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => RecoveryCodeControllerImp());
    return Scaffold(
      appBar: AppBar(
        leading: const CustomBackButton(),
        title: Text("24".tr, style: Get.textTheme.displayLarge),
        backgroundColor: AppColor.primaryColorWhite,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSize.paddingContentScreen,
        ),
        child: Column(children: [
          const SizedBox(height: AppSize.md),
          CustomTextTopAuth(title: "25".tr),
          const SizedBox(height: AppSize.xlg),
          GetBuilder<RecoveryCodeControllerImp>(
            builder: (controller) => OtpTextField(
              numberOfFields: AppSize.numberOfField,
              borderColor: AppColor.primaryColorBlue,
              fieldWidth: AppSize.widthOfField,
              borderRadius: BorderRadius.circular(AppSize.borderRaduis),
              fillColor: AppColor.primaryColorGrey1,
              showFieldAsBox: true,
              onSubmit: (String verificationCode) {
                controller.goToNextNewPassword(verificationCode);
              }, // end onSubmit
            ),
          ),
          const Spacer(),
          GetBuilder<RecoveryCodeControllerImp>(
            builder: (controller) => CustomPrimaryButton(
              onPressed: () => controller.sendAgain(),
              title: "34".tr,
            ),
          ),
          const SizedBox(height: AppSize.lg),
        ]),
      ),
    );
  }
}
