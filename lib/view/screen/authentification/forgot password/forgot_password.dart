import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:shopy/controller/authentification/forgot%20password/forgot_password_controller.dart';
import 'package:shopy/core/class/status_request.dart';
import 'package:shopy/core/constant/app_size.dart';
import 'package:shopy/core/constant/color.dart';
import 'package:shopy/core/constant/image_asset.dart';
import 'package:shopy/core/functions/valid_input.dart';
import 'package:shopy/view/widget/authentification/custom_primary_button.dart';
import 'package:shopy/view/widget/authentification/custom_text_form_field.dart';
import 'package:shopy/view/widget/authentification/custom_text_top_auth.dart';
import 'package:shopy/view/widget/back_button.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: const CustomBackButton(),
          title: Text("5".tr, style: Get.textTheme.displayLarge),
          backgroundColor: AppColor.primaryColorWhite,
          elevation: 0,
        ),
        body: GetBuilder<ForgotPasswordControllerImp>(
          init: ForgotPasswordControllerImp(),
          builder: (controller) => StatusRequest.loading ==
                  controller.statusRequest
              ? Center(child: LottieBuilder.asset(AppImageAsset.lottieLoading))
              : Form(
                  key: controller.formstate,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppSize.paddingContentScreen,
                    ),
                    child: Column(children: [
                      const SizedBox(height: AppSize.md),
                      CustomTextTopAuth(title: "21".tr),
                      const SizedBox(height: AppSize.xlg),
                      CustomTextFormField(
                        hintText: "23".tr,
                        keyboardType: TextInputType.emailAddress,
                        controller: controller.emailController,
                        validator: (valid) =>
                            validInput(valid!, 5, 155, "email"),
                      ),
                      const Spacer(),
                      CustomPrimaryButton(
                        onPressed: () => controller.goToRecoveryCodeScreen(),
                        title: "22".tr,
                      ),
                      const SizedBox(height: AppSize.paddingContentScreenMd),
                    ]),
                  ),
                ),
        ));
  }
}
