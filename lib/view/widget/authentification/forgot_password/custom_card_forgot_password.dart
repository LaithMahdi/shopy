import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shopy/core/constant/app_size.dart';
import 'package:shopy/core/constant/color.dart';
import 'package:shopy/view/widget/authentification/custom_text_auth.dart';

class CustomCardForgotPassword extends StatelessWidget {
  final String picture;
  final String title;
  final String subTitle;
  const CustomCardForgotPassword({
    super.key,
    required this.picture,
    required this.title,
    required this.subTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppSize.paddingBetween),
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColor.primaryColorGrey,
          width: AppSize.border,
          strokeAlign: BorderSide.strokeAlignCenter,
        ),
        borderRadius: BorderRadius.circular(AppSize.borderRaduis),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(AppSize.paddingContentScreen),
            decoration: BoxDecoration(
              border: Border.all(
                color: AppColor.primaryColorGrey,
                width: AppSize.border,
                strokeAlign: BorderSide.strokeAlignCenter,
              ),
              borderRadius: BorderRadius.circular(AppSize.borderRaduis),
            ),
            child: SvgPicture.asset(picture),
          ),
          const SizedBox(width: AppSize.md),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTextAuth(title: title, semiBold: true),
              const SizedBox(
                height: AppSize.paddingBetween,
              ),
              CustomTextAuth(title: subTitle, semiBold: true),
            ],
          )
        ],
      ),
    );
  }
}
