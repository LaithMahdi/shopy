import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:shopy/controller/home/home_controller.dart';
import 'package:shopy/core/constant/app_size.dart';
import 'package:shopy/core/constant/color.dart';
import 'package:shopy/core/constant/image_asset.dart';
import 'package:shopy/view/widget/authentification/custom_text_form_field.dart';

class CustomSearchAndImagePicker extends GetView<HomeControllerImpl> {
  const CustomSearchAndImagePicker({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColor.primaryColorBlue,
      padding: const EdgeInsets.symmetric(
        horizontal: AppSize.paddingContentScreen,
        vertical: AppSize.paddingContentScreenMd,
      ),
      child: Row(children: [
        Expanded(
          flex: 8,
          child: CustomTextFormField(
            hintText: "39".tr,
            keyboardType: TextInputType.text,
            icon: Icons.search,
            controller: controller.searchController,
            validator: (valid) {
              return null;
            },
          ),
        ),
        const SizedBox(width: AppSize.buttonPadding),
        Expanded(
          flex: 2,
          child: Container(
            padding: const EdgeInsets.all(AppSize.buttonPadding),
            decoration: BoxDecoration(
              color: AppColor.primaryColorWhite,
              borderRadius: BorderRadius.circular(AppSize.borderRaduis),
            ),
            child: SvgPicture.asset(
              AppImageAsset.camera,
              color: AppColor.primaryColorBlue,
              width: AppSize.lg,
            ),
          ),
        ),
      ]),
    );
  }
}
