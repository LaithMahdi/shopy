import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopy/core/constant/app_size.dart';
import 'package:shopy/core/constant/color.dart';

class SuccessfulMessage extends StatelessWidget {
  const SuccessfulMessage({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width,
      height: Get.height * 0.15,
      child: Stack(
        children: [
          const Positioned(
            child: Center(
              child: Icon(
                Icons.check_circle,
                size: AppSize.successIcon,
                color: AppColor.primaryColorGreen,
              ),
            ),
          ),
          Positioned(
            right: AppSize.successIcon,
            top: AppSize.md,
            child: Transform.rotate(
              angle: AppSize.border,
              child: const Icon(
                Icons.close,
                size: AppSize.buttonPadding,
                color: AppColor.primaryColorGreen,
              ),
            ),
          ),
          const Positioned(
            left: AppSize.successIconMd,
            top: AppSize.md,
            child: Icon(
              Icons.radio_button_unchecked,
              size: AppSize.borderRaduis,
              color: AppColor.primaryColorGreen,
            ),
          ),
          const Positioned(
            left: AppSize.successIcon,
            bottom: AppSize.borderRaduis,
            child: Icon(
              Icons.circle,
              size: AppSize.borderRaduis,
              color: AppColor.primaryColorGreen,
            ),
          ),
        ],
      ),
    );
  }
}
