import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:shopy/controller/home/home_controller.dart';
import 'package:shopy/core/class/handling_data_view.dart';
import 'package:shopy/core/class/status_request.dart';
import 'package:shopy/core/constant/app_size.dart';
import 'package:shopy/core/constant/color.dart';
import 'package:shopy/core/constant/image_asset.dart';
import 'package:shopy/core/functions/translate_database.dart';
import 'package:shopy/data/model/shoes_model.dart';
import 'package:shopy/view/widget/authentification/custom_primary_button.dart';
import 'package:shopy/view/widget/home/custom_container_shoes_card.dart';
import 'package:shopy/view/widget/home/custom_genre_image_and_text.dart';
import 'package:shopy/view/widget/home/custom_search_and_image_picker.dart';
import 'package:shopy/view/widget/home/custom_slide_card.dart';
import 'package:shopy/view/widget/wishlist/custom_card_shoes_vertical.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeControllerImpl());
    return Scaffold(
      backgroundColor: AppColor.primaryColorWhite,
      body: GetBuilder<HomeControllerImpl>(
        builder: (controller) => StatusRequest.loading ==
                controller.statusRequest
            ? Center(child: LottieBuilder.asset(AppImageAsset.lottieLoading))
            : SafeArea(
                child: ListView(
                  physics: const BouncingScrollPhysics(),
                  children: <Widget>[
                    const CustomSearchAndImagePicker(),
                    !controller.search
                        ? Column(
                            children: [
                              SizedBox(
                                height: Get.height * 0.2,
                                child: Stack(
                                  children: [
                                    Container(
                                      height: Get.height * 0.1,
                                      decoration: const BoxDecoration(
                                        color: AppColor.primaryColorBlue,
                                        borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(20),
                                          bottomRight: Radius.circular(20),
                                        ),
                                      ),
                                    ),
                                    CustomSlideCard(
                                      picture: AppImageAsset.airMax2090,
                                      genre: "40".tr,
                                      name: "41".tr,
                                      onPressed: () {},
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: AppSize.buttonPadding),
                              Container(
                                height: Get.height * 0.13,
                                padding: const EdgeInsets.symmetric(
                                  horizontal: AppSize.paddingContentScreen,
                                ),
                                child: ListView.separated(
                                  itemCount: controller.category.length,
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  physics: const BouncingScrollPhysics(),
                                  separatorBuilder: (context, index) =>
                                      const SizedBox(
                                    width: AppSize.paddingContentScreenMd,
                                  ),
                                  itemBuilder: (context, index) =>
                                      CustomGenreImageAndText(
                                    onTap: () {
                                      controller.goToCategoryScreen(
                                          controller.category[index].id);
                                    },
                                    categoryModel: controller.category[index],
                                  ),
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: AppSize.paddingContentScreen,
                                  vertical: AppSize.lg,
                                ),
                                decoration: BoxDecoration(
                                  color: AppColor.primaryColorGrey1,
                                  borderRadius: BorderRadius.circular(
                                    AppSize.paddingContentScreenMd,
                                  ),
                                ),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Expanded(
                                          flex: 4,
                                          child: Text(
                                            "47".tr,
                                            style: Get.textTheme.headlineLarge!
                                                .copyWith(
                                              fontSize: AppSize.fs,
                                              color: AppColor.primaryColorGrey,
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 2,
                                          child: CustomPrimaryButton(
                                            onPressed: () {},
                                            fontSize: true,
                                            title: "48".tr,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                        height: AppSize.buttonPadding),
                                    const CustomShoesWithDiscountHomeScreen()
                                  ],
                                ),
                              )
                            ],
                          )
                        : const SearchMenuItems()
                  ],
                ),
              ),
      ),
    );
  }
}

class SearchMenuItems extends GetView<HomeControllerImpl> {
  const SearchMenuItems({super.key});

  @override
  Widget build(BuildContext context) {
    return HandlingDataView(
      statusRequest: controller.statusRequest,
      widget: ListView.separated(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSize.paddingContentScreen,
          vertical: AppSize.borderRaduis,
        ),
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: controller.shoesSearch.length,
        separatorBuilder: (context, index) =>
            const SizedBox(height: AppSize.borderRaduis),
        itemBuilder: (context, index) {
          ShoesModel shoesModel = controller.shoesSearch[index];
          return CustomCardShoesVertical(
            picture: shoesModel.shoesPicture,
            name:
                "${translateDatabase(shoesModel.shoesName, shoesModel.shoesNameAr)}",
            prise: shoesModel.shoesPrice,
          );
        },
      ),
    );
  }
}
