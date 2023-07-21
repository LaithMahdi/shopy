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
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: AppSize.fs),
                          Text(
                            "${translateDatabase(controller.shoesModel!.shoesName, controller.shoesModel!.shoesNameAr)}",
                            style: Get.textTheme.headlineLarge!.copyWith(
                              color: AppColor.primaryColorGrey,
                              fontSize: AppSize.fs,
                            ),
                          ),
                          const SizedBox(height: AppSize.fs1),
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
                              Container(
                                decoration: BoxDecoration(
                                    color: AppColor.primaryColorGrey4,
                                    borderRadius: BorderRadius.circular(
                                        AppSize.borderRaduis)),
                                padding: const EdgeInsets.all(AppSize.fs2),
                                child: Row(
                                  children: [
                                    InkWell(
                                      onTap: () => controller.onMinus(),
                                      child: const Icon(
                                        Icons.remove,
                                        color: AppColor.primaryColorGrey1,
                                      ),
                                    ),
                                    const SizedBox(width: AppSize.fs2),
                                    Obx(() => Text(
                                          "${controller.counter.value}",
                                          style: Get.textTheme.headlineLarge!
                                              .copyWith(
                                            color: AppColor.primaryColorGrey1,
                                          ),
                                        )),
                                    const SizedBox(width: AppSize.fs2),
                                    InkWell(
                                      onTap: () => controller.onAdd(),
                                      child: const Icon(
                                        Icons.add,
                                        color: AppColor.primaryColorGrey1,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: AppSize.md),
                          Flexible(
                            child: Text(
                              "${translateDatabase(controller.shoesModel!.shoesDescription, controller.shoesModel!.shoesDescriptionAr)}",
                              style: Get.textTheme.headlineSmall!.copyWith(
                                color: AppColor.primaryColorGrey4,
                                fontWeight: FontWeight.w500,
                                //fontSize: AppSize.fs,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 15),
                        child: CustomPrimaryButton(
                            onPressed: () {}, title: "title"),
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
