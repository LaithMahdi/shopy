import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopy/controller/home/favorite/favorite_controller.dart';
import 'package:shopy/controller/home/home_controller.dart';
import 'package:shopy/core/constant/app_size.dart';
import 'package:shopy/core/constant/color.dart';
import 'package:shopy/core/constant/routes.dart';
import 'package:shopy/core/functions/translate_database.dart';
import 'package:shopy/data/model/shoes_model.dart';

class CustomShoesWithDiscountHomeScreen extends GetView<HomeControllerImpl> {
  const CustomShoesWithDiscountHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Get.height * 0.31,
      child: ListView.separated(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          ShoesModel shoesModel = controller.shoes[index];
          bool isFavorite =
              Get.find<FavoriteController>().isFavorite(shoesModel.id);

          return GetBuilder<HomeControllerImpl>(
            builder: (controller) => CustomContainerShoesCard(
              shoesModel: shoesModel,
              isTapFavorite: isFavorite,
              onTapFavorite: () {
                Get.find<FavoriteController>().toggleFavorite(shoesModel.id);
              },
              onTapAdd: () {},
            ),
          );
        },
        separatorBuilder: (context, index) =>
            const SizedBox(width: AppSize.paddingBetween),
        itemCount: controller.shoes.length,
      ),
    );
  }
}

class CustomContainerShoesCard extends StatelessWidget {
  final ShoesModel shoesModel;

  final bool? isTapFavorite;
  final VoidCallback onTapFavorite;
  final VoidCallback onTapAdd;

  const CustomContainerShoesCard({
    super.key,
    required this.shoesModel,
    required this.onTapFavorite,
    required this.onTapAdd,
    this.isTapFavorite,
  });

  @override
  Widget build(BuildContext context) {
    final favoriteController = Get.find<FavoriteController>();
    // bool isFavorite = favoriteController.isFavorite(shoesModel.id);
    return GestureDetector(
      onTap: () =>
          Get.toNamed(AppRoute.detail, arguments: {'id': shoesModel.id}),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(
            Radius.circular(AppSize.borderRaduis),
          ),
          color: AppColor.primaryColorWhite1,
          border: Border.all(color: AppColor.primaryColorGrey2),
        ),
        width: Get.width * 0.45,
        padding: const EdgeInsets.all(AppSize.paddingBetween),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(AppSize.borderRaduis),
                  child: Hero(
                    tag: shoesModel.id,
                    child: CachedNetworkImage(
                      imageUrl: shoesModel.shoesPicture,
                      width: Get.width * 0.4,
                      height: Get.height * 0.18,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Positioned(
                  right: AppSize.borderRaduis,
                  top: AppSize.borderRaduis,
                  child: GestureDetector(
                    onTap: () {
                      favoriteController.toggleFavorite(shoesModel.id);
                    },
                    child: Obx(
                      () => Icon(
                        favoriteController.isFavorite(shoesModel.id)
                            ? Icons.favorite
                            : Icons.favorite_border,
                        color: favoriteController.isFavorite(shoesModel.id)
                            ? AppColor.primaryColorRed
                            : AppColor.primaryColorGrey,
                        size: AppSize.lg,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: AppSize.md),
            Text(
              "${translateDatabase(shoesModel.shoesName, shoesModel.shoesNameAr)}",
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: Get.textTheme.headlineMedium,
            ),
            const SizedBox(height: AppSize.fs1),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "\$${shoesModel.shoesPrice}",
                  style: Get.textTheme.headlineMedium!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                InkWell(
                  onTap: onTapAdd,
                  child: const Icon(
                    Icons.add,
                    size: AppSize.md,
                    color: AppColor.primaryColorGrey,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
