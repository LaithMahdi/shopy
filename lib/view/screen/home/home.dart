import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopy/controller/home/home_controller.dart';
import 'package:shopy/core/constant/app_size.dart';
import 'package:shopy/core/constant/color.dart';
import 'package:shopy/core/constant/image_asset.dart';
import 'package:shopy/data/datasource/static/genres.dart';
import 'package:shopy/data/datasource/static/shoes_list.dart';
import 'package:shopy/data/model/shoes_model.dart';
import 'package:shopy/view/widget/authentification/custom_primary_button.dart';
import 'package:shopy/view/widget/home/custom_container_shoes_card.dart';
import 'package:shopy/view/widget/home/custom_genre_image_and_text.dart';
import 'package:shopy/view/widget/home/custom_search_and_image_picker.dart';
import 'package:shopy/view/widget/home/custom_slide_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    HomeControllerImpl controller = Get.put(HomeControllerImpl());
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            CustomSearchAndImagePicker(controller: controller),
            SizedBox(
              height: Get.height * 0.2,
              child: Stack(
                children: [
                  Container(
                    height: Get.height * 0.1,
                    decoration: const BoxDecoration(
                      color: AppColor.primaryColorBlue,
                      borderRadius: BorderRadius.only(
                        bottomLeft:
                            Radius.circular(AppSize.paddingContentScreen),
                        bottomRight:
                            Radius.circular(AppSize.paddingContentScreen),
                      ),
                    ),
                  ),
                  Positioned(
                    child: CustomSlideCard(
                      picture: AppImageAsset.airMax2090,
                      genre: "40".tr,
                      name: "41".tr,
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: AppSize.buttonPadding),
            Container(
              height: Get.height * 0.12,
              padding: const EdgeInsets.symmetric(
                horizontal: AppSize.paddingContentScreen,
              ),
              child: ListView.separated(
                itemCount: listGenres.length,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                separatorBuilder: (context, index) => const SizedBox(
                  width: AppSize.paddingContentScreenMd,
                ),
                itemBuilder: (context, index) => CustomGenreImageAndText(
                  name: listGenres[index].name,
                  picture: listGenres[index].picture,
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
                          style: Get.textTheme.headlineLarge!.copyWith(
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
                  const SizedBox(height: AppSize.buttonPadding),
                  SizedBox(
                    height: Get.height * 0.32,
                    child: ListView.separated(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        ShoesModel shoes = shoesList[index];
                        return CustomContainerShoesCard(
                          picture: shoes.picture,
                          name: shoes.name,
                          prise: shoes.prise,
                          nbColor: shoes.nbColor,
                          onTapFavorite: () {},
                          onTapAdd: () {},
                        );
                      },
                      separatorBuilder: (context, index) =>
                          const SizedBox(width: AppSize.paddingBetween),
                      itemCount: shoesList.length,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
