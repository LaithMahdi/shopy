import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopy/controller/authentification/forgot%20password/forgot_password_controller.dart';
import 'package:shopy/core/constant/app_size.dart';
import 'package:shopy/core/constant/color.dart';
import 'package:shopy/core/constant/image_asset.dart';
import 'package:shopy/view/widget/authentification/custom_text_top_auth.dart';
import 'package:shopy/view/widget/authentification/forgot_password/custom_card_forgot_password.dart';
import 'package:shopy/view/widget/back_button.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ForgotPasswordControllerImp controller =
        Get.put(ForgotPasswordControllerImp());
    return Scaffold(
      appBar: AppBar(
        leading: const CustomBackButton(),
        title: Text("5".tr, style: Get.textTheme.displayLarge),
        backgroundColor: AppColor.primaryColorWhite,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSize.paddingContentScreen,
        ),
        child: Column(children: [
          const SizedBox(height: AppSize.md),
          CustomTextTopAuth(title: "21".tr),
          const SizedBox(height: AppSize.xlg),
          InkWell(
            onTap: () => controller.goToSendViaSms(),
            child: CustomCardForgotPassword(
              picture: AppImageAsset.phone,
              title: "22".tr,
              subTitle: "*** *******61",
            ),
          ),
          const SizedBox(height: AppSize.paddingBetween),
          InkWell(
            onTap: () => controller.goToSendViaMail(),
            child: CustomCardForgotPassword(
              picture: AppImageAsset.mail,
              title: "23".tr,
              subTitle: "****ic16@gmail.com",
            ),
          ),
        ]),
      ),
    );
  }
}
