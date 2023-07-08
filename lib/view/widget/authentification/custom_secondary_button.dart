import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shopy/core/constant/app_size.dart';
import 'package:shopy/core/constant/color.dart';

class CustomSecondaryButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String picture;
  const CustomSecondaryButton({
    super.key,
    required this.onPressed,
    required this.picture,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(
            vertical: AppSize.md, horizontal: AppSize.xlg),
        backgroundColor: AppColor.primaryColorGrey2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSize.borderRaduis),
        ),
      ),
      child: SvgPicture.asset(
        picture,
        width: AppSize.md,
        height: AppSize.paddingContentScreenMd,
      ),
    );
  }
}
