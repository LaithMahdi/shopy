import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopy/controller/authentification/sign_in_controller.dart';
import 'package:shopy/core/constant/app_size.dart';
import 'package:shopy/core/constant/color.dart';
import 'package:shopy/core/constant/image_asset.dart';
import 'package:shopy/core/functions/valid_input.dart';
import 'package:shopy/view/widget/authentification/custom_bottom_text_inline_auth.dart';
import 'package:shopy/view/widget/authentification/custom_divider_text_auth.dart';
import 'package:shopy/view/widget/authentification/custom_primary_button.dart';
import 'package:shopy/view/widget/authentification/custom_secondary_button.dart';
import 'package:shopy/view/widget/authentification/custom_text_auth.dart';
import 'package:shopy/view/widget/authentification/custom_text_form_field.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SignInControllerImp controller = Get.put(SignInControllerImp());
    return Scaffold(
      backgroundColor: AppColor.primaryColorWhite,
      appBar: AppBar(
        title: Text(
          "1".tr,
          style: Get.textTheme.displayLarge,
        ),
        centerTitle: true,
        backgroundColor: AppColor.primaryColorWhite,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSize.paddingContentScreen,
        ),
        child: Form(
          key: controller.formstate,
          child: ListView(children: <Widget>[
            const SizedBox(height: AppSize.md),
            Text(
              "2".tr,
              style: Get.textTheme.headlineMedium!.copyWith(
                fontWeight: FontWeight.w400,
                fontSize: 13,
                height: AppSize.textHeightSm,
              ),
            ),
            const SizedBox(height: AppSize.xlg),
            CustomTextAuth(title: "3".tr),
            const SizedBox(height: AppSize.paddingBetween),
            CustomTextFormField(
              hintText: "example@gmail.com",
              icon: Icons.mail_outlined,
              keyboardType: TextInputType.emailAddress,
              validator: (valid) {
                return validInput(valid!, 5, 30, "email");
              },
              controller: controller.mailController,
            ),
            const SizedBox(height: AppSize.lg),
            CustomTextAuth(title: "4".tr),
            const SizedBox(height: AppSize.paddingBetween),
            GetBuilder<SignInControllerImp>(
              builder: (controller) => CustomTextFormField(
                hintText: "**********",
                icon: controller.isShowPassword == true
                    ? Icons.visibility_off
                    : Icons.visibility,
                keyboardType: TextInputType.text,
                obscureText: controller.isShowPassword,
                onTapShowEye: () => controller.showPassword(),
                controller: controller.passwordController,
                validator: (valid) {
                  return validInput(valid!, 5, 30, "password");
                },
              ),
            ),
            const SizedBox(height: AppSize.lg),
            Container(
              alignment: Alignment.centerRight,
              child: InkWell(
                child: CustomTextAuth(title: "5".tr),
                onTap: () => controller.goToForgotPassword(),
              ),
            ),
            const SizedBox(height: AppSize.xlg),
            CustomPrimaryButton(
              onPressed: () => controller.signIn(),
              title: "1".tr,
            ),
            const SizedBox(height: AppSize.xlg),
            CustomDividerTextAuth(title: "6".tr),
            const SizedBox(height: AppSize.paddingContentScreenMd),
            Row(
              children: [
                Expanded(
                  child: CustomSecondaryButton(
                    onPressed: () => controller.signInwithFacebook(),
                    picture: AppImageAsset.facebook,
                  ),
                ),
                const SizedBox(width: AppSize.md),
                Expanded(
                  child: CustomSecondaryButton(
                    onPressed: () => controller.signInwithGoogle(),
                    picture: AppImageAsset.google,
                  ),
                )
              ],
            ),
            const SizedBox(height: AppSize.xlg),
            CustomBottomTextInline(
              firstTitle: "7".tr,
              secondTitle: "8".tr,
              onTap: () => controller.goToSignUp(),
            ),
            const SizedBox(height: AppSize.lg),
          ]),
        ),
      ),
    );
  }
}
