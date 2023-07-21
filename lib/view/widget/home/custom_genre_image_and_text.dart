import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:shopy/core/constant/app_size.dart';
import 'package:shopy/core/constant/color.dart';
import 'package:shopy/core/constant/image_asset.dart';
import 'package:shopy/core/functions/translate_database.dart';
import 'package:shopy/data/model/category_model.dart';

class CustomGenreImageAndText extends StatelessWidget {
  final CategoryModel categoryModel;
  final VoidCallback onTap;
  const CustomGenreImageAndText({
    super.key,
    required this.categoryModel,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(
              vertical: AppSize.md,
              horizontal: AppSize.buttonPadding,
            ),
            decoration: BoxDecoration(
              color: AppColor.primaryColorBlue.withOpacity(0.2),
              borderRadius: BorderRadius.circular(
                AppSize.borderRaduis,
              ),
            ),
            child: SvgPicture.asset(
              "${AppImageAsset.rootImages}/icones/${categoryModel.categoryPicture}",
              width: AppSize.paddingContentScreen,
              height: AppSize.paddingContentScreen,
              color: AppColor.primaryColorBlue,
            ),
          ),
          const SizedBox(height: AppSize.paddingBetween),
          Text(
            "${translateDatabase(categoryModel.categoryName, categoryModel.categoryNameAr)}",
            style: Get.textTheme.headlineSmall,
          )
        ],
      ),
    );
  }
}
