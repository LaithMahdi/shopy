import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopy/controller/authentification/sign_up_controller.dart';
import 'package:shopy/core/class/handling_data_view.dart';
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
import 'package:shopy/view/widget/back_button.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SignUpControllerImp());
    return Scaffold(
        backgroundColor: AppColor.primaryColorWhite,
        appBar: AppBar(
          leading: const CustomBackButton(),
          title: Text("8".tr, style: Get.textTheme.displayLarge),
          backgroundColor: AppColor.primaryColorWhite,
          elevation: 0,
        ),
        body: GetBuilder<SignUpControllerImp>(
          builder: (controller) => HandlingDataRequest(
            statusRequest: controller.statusRequest,
            widget: Form(
              key: controller.formstate,
              child: ListView(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppSize.paddingContentScreen,
                  ),
                  children: <Widget>[
                    const SizedBox(height: AppSize.md),
                    CustomTextAuth(title: "10".tr),
                    const SizedBox(height: AppSize.paddingBetween),
                    CustomTextFormField(
                      hintText: "10".tr,
                      icon: Icons.person_outlined,
                      keyboardType: TextInputType.text,
                      validator: (valid) {
                        return validInput(valid!, 5, 30, "username");
                      },
                      controller: controller.nameController,
                    ),
                    const SizedBox(height: AppSize.lg),
                    CustomTextAuth(title: "3".tr),
                    const SizedBox(height: AppSize.paddingBetween),
                    CustomTextFormField(
                      hintText: "example@gmail.com",
                      icon: Icons.mail_outlined,
                      keyboardType: TextInputType.emailAddress,
                      validator: (valid) {
                        return validInput(valid!, 5, 100, "email");
                      },
                      controller: controller.mailController,
                    ),
                    const SizedBox(height: AppSize.lg),
                    CustomTextAuth(title: "4".tr),
                    const SizedBox(height: AppSize.paddingBetween),
                    GetBuilder<SignUpControllerImp>(
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
                    const SizedBox(height: AppSize.xlg),
                    CustomPrimaryButton(
                      onPressed: () => controller.signUp(),
                      title: "8".tr,
                    ),
                    const SizedBox(height: AppSize.xlg),
                    CustomDividerTextAuth(title: "11".tr),
                    const SizedBox(height: AppSize.paddingContentScreenMd),
                    Row(
                      children: [
                        Expanded(
                          child: CustomSecondaryButton(
                            onPressed: () {},
                            picture: AppImageAsset.facebook,
                          ),
                        ),
                        const SizedBox(width: AppSize.md),
                        Expanded(
                          child: CustomSecondaryButton(
                            onPressed: () {},
                            picture: AppImageAsset.google,
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: AppSize.xlg),
                    CustomBottomTextInline(
                      firstTitle: "12".tr,
                      secondTitle: "1".tr,
                      onTap: () {},
                    ),
                    const SizedBox(height: AppSize.lg),
                  ]),
            ),
          ),
        ));
  }
}
