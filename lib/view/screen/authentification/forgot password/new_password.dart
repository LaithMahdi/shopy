import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopy/controller/authentification/forgot%20password/new_password_controller.dart';
import 'package:shopy/core/constant/app_size.dart';
import 'package:shopy/core/constant/color.dart';
import 'package:shopy/core/functions/valid_input.dart';
import 'package:shopy/view/widget/authentification/custom_primary_button.dart';
import 'package:shopy/view/widget/authentification/custom_text_auth.dart';
import 'package:shopy/view/widget/authentification/custom_text_form_field.dart';
import 'package:shopy/view/widget/authentification/custom_text_top_auth.dart';
import 'package:shopy/view/widget/back_button.dart';

class NewPasswordScreen extends StatelessWidget {
  const NewPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    NewPasswordControllerImp controller = Get.put(NewPasswordControllerImp());
    return Scaffold(
      appBar: AppBar(
        leading: const CustomBackButton(),
        title: Text("30".tr, style: Get.textTheme.displayLarge),
        backgroundColor: AppColor.primaryColorWhite,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSize.paddingContentScreen,
        ),
        child: Form(
          key: controller.formstate,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const SizedBox(height: AppSize.md),
            CustomTextTopAuth(title: "31".tr),
            const SizedBox(height: AppSize.xlg),
            CustomTextAuth(title: "30".tr),
            const SizedBox(height: AppSize.paddingBetween),
            GetBuilder<NewPasswordControllerImp>(
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
            CustomTextAuth(title: "32".tr),
            const SizedBox(height: AppSize.paddingBetween),
            GetBuilder<NewPasswordControllerImp>(
              builder: (controller) => CustomTextFormField(
                hintText: "**********",
                icon: controller.isNewShowPassword == true
                    ? Icons.visibility_off
                    : Icons.visibility,
                keyboardType: TextInputType.text,
                obscureText: controller.isNewShowPassword,
                onTapShowEye: () => controller.showNewPassword(),
                controller: controller.newPasswordController,
                validator: (valid) {
                  return validInput(valid!, 5, 30, "new password");
                },
              ),
            ),
            const Spacer(),
            CustomPrimaryButton(
              onPressed: () => controller.updatePassword(),
              title: "33".tr,
            ),
            const SizedBox(height: AppSize.lg),
          ]),
        ),
      ),
    );
  }
}
