import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopy/core/constant/app_size.dart';
import 'package:shopy/core/constant/color.dart';
import 'package:shopy/core/constant/image_asset.dart';

class CustomCardPaymentMethod extends StatelessWidget {
  final String numberOfCard;
  final String nameOfPersonCard;
  final String dateOfCard;
  final bool? isSecondaryCard;
  const CustomCardPaymentMethod({
    super.key,
    required this.numberOfCard,
    required this.nameOfPersonCard,
    required this.dateOfCard,
    this.isSecondaryCard,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width * 0.75,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppSize.fs),
        color: isSecondaryCard == false || isSecondaryCard == null
            ? AppColor.primaryColorGrey2.withOpacity(0.5)
            : AppColor.primaryColorGrey,
      ),
      padding: const EdgeInsets.symmetric(
        vertical: AppSize.buttonPadding,
        horizontal: AppSize.lg,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.topRight,
            child: Image.asset(
              AppImageAsset.master,
            ),
          ),
          const SizedBox(height: AppSize.paddingBetween),
          Image.asset(
            isSecondaryCard == false || isSecondaryCard == null
                ? AppImageAsset.sim
                : AppImageAsset.sim1,
          ),
          const SizedBox(height: AppSize.paddingBetween),
          Text(
            numberOfCard,
            style: isSecondaryCard == false
                ? Get.textTheme.headlineMedium
                : Get.textTheme.headlineMedium!.copyWith(
                    color: AppColor.primaryColorGrey4,
                  ),
          ),
          const SizedBox(height: AppSize.md),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(nameOfPersonCard,
                  style: isSecondaryCard == false
                      ? Get.textTheme.headlineSmall
                      : Get.textTheme.headlineSmall!.copyWith(
                          color: AppColor.primaryColorGrey4,
                        )),
              Text(dateOfCard,
                  style: isSecondaryCard == false
                      ? Get.textTheme.headlineSmall
                      : Get.textTheme.headlineSmall!.copyWith(
                          color: AppColor.primaryColorGrey4,
                        )),
            ],
          ),
          const SizedBox(height: AppSize.fs2),
        ],
      ),
    );
  }
}
