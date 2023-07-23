import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:shopy/controller/home/detail/detail_controller.dart';
import 'package:shopy/core/class/status_request.dart';
import 'package:shopy/core/constant/app_size.dart';
import 'package:shopy/core/constant/color.dart';
import 'package:shopy/core/constant/image_asset.dart';
import 'package:shopy/core/functions/translate_database.dart';
import 'package:shopy/view/widget/authentification/custom_primary_button.dart';
import 'package:shopy/view/widget/back_button.dart';
import 'package:shopy/view/widget/wishlist/custom_counter.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(DetailControllerImp());
    return Scaffold(
      appBar: AppBar(
        leading: const CustomBackButton(),
        title: Text("43".tr, style: Get.textTheme.displayLarge),
        backgroundColor: AppColor.primaryColorWhite,
        elevation: 0,
      ),
      body: GetBuilder<DetailControllerImp>(
        builder: (controller) => StatusRequest.loading ==
                controller.statusRequest
            ? Center(child: LottieBuilder.asset(AppImageAsset.lottieLoading))
            : Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: AppSize.paddingContentScreen),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 4,
                      child: Hero(
                        tag: controller.shoesModel!.id,
                        child: CachedNetworkImage(
                          imageUrl: controller.shoesModel!.shoesPicture,
                          fit: BoxFit.fill,
                          width: Get.width,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 4,
                      child: ListView(
                        physics: const BouncingScrollPhysics(),
                        children: [
                          const SizedBox(height: AppSize.fs),
                          Text(
                            "${translateDatabase(controller.shoesModel!.category.categoryName, controller.shoesModel!.category.categoryNameAr)}",
                            style: Get.textTheme.headlineMedium!.copyWith(
                              color:
                                  AppColor.primaryColorGrey3.withOpacity(0.5),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: AppSize.fs1),
                          Text(
                            "${translateDatabase(controller.shoesModel!.shoesName, controller.shoesModel!.shoesNameAr)}",
                            style: Get.textTheme.headlineLarge!.copyWith(
                              color: AppColor.primaryColorGrey,
                              fontSize: AppSize.fs,
                            ),
                          ),
                          const SizedBox(height: AppSize.fs2),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Obx(
                                () => Text(
                                  "\$ ${controller.prise.toStringAsFixed(2)} ",
                                  style: Get.textTheme.headlineLarge!.copyWith(
                                    color: AppColor.primaryColorGrey4,
                                    fontSize: AppSize.fs,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              Obx(
                                () => CustomCounter(
                                  counter: "${controller.counter.value}",
                                  onTapAdd: () => controller.onAdd(),
                                  onTapMinus: () => controller.onMinus(),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: AppSize.fs1),
                          const Divider(color: AppColor.primaryColorGrey4),
                          const SizedBox(height: AppSize.fs1),
                          Text("51".tr, style: Get.textTheme.headlineMedium),
                          const SizedBox(height: AppSize.fs),
                          SizedBox(
                            height: Get.height * 0.05,
                            child: ListView.separated(
                              physics: const BouncingScrollPhysics(),
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemCount: controller.size.length,
                              separatorBuilder: (context, index) =>
                                  const SizedBox(width: AppSize.fs),
                              itemBuilder: (context, index) =>
                                  GetBuilder<DetailControllerImp>(
                                builder: (controller) {
                                  bool isTapped = controller.tapedSize[index];
                                  return InkWell(
                                    onTap: () {
                                      controller.changeTapedSize(index);
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: isTapped
                                            ? AppColor.primaryColorGrey
                                            : AppColor.primaryColorGrey2,
                                        borderRadius: BorderRadius.circular(
                                            AppSize.borderRaduis),
                                      ),
                                      padding: const EdgeInsets.symmetric(
                                        vertical: AppSize.fs1,
                                        horizontal: AppSize.buttonPadding,
                                      ),
                                      child: Text(
                                        controller.size[index],
                                        style: Get.textTheme.headlineSmall!
                                            .copyWith(
                                          color: isTapped
                                              ? AppColor.primaryColorWhite
                                              : AppColor.primaryColorGrey,
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                          const SizedBox(height: AppSize.md),
                          Text("50".tr, style: Get.textTheme.headlineMedium),
                          const SizedBox(height: AppSize.md),
                          Text(
                            "${translateDatabase(controller.shoesModel!.shoesDescription, controller.shoesModel!.shoesDescriptionAr)}",
                            style: Get.textTheme.headlineSmall!.copyWith(
                              color: AppColor.primaryColorGrey4,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: AppSize.md),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 15),
                        child: CustomPrimaryButton(
                            onPressed: () {
                              controller.goToCheckout();
                            },
                            title: "44".tr),
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
