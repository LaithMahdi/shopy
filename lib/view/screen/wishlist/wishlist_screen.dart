import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopy/controller/wishlist/wishlist_controller.dart';
import 'package:shopy/core/constant/app_size.dart';
import 'package:shopy/core/constant/color.dart';
import 'package:shopy/core/functions/translate_database.dart';
import 'package:shopy/data/model/shoes_model.dart';
import 'package:shopy/view/widget/authentification/custom_primary_button.dart';
import 'package:shopy/view/widget/authentification/custom_text_form_field.dart';
import 'package:shopy/view/widget/back_button.dart';
import 'package:shopy/view/widget/wishlist/custom_card_shoes_vertical.dart';
import 'package:shopy/view/widget/wishlist/custom_wishlist_button.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(WishlistControllerImp());
    return Scaffold(
      backgroundColor: AppColor.primaryColorWhite,
      appBar: AppBar(
        leading: const CustomBackButton(),
        title: Text("53".tr, style: Get.textTheme.displayLarge),
        backgroundColor: AppColor.primaryColorWhite,
        elevation: 0,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSize.paddingContentScreen,
        ),
        child: GetBuilder<WishlistControllerImp>(
          builder: (controller) => Column(
            children: [
              Expanded(
                flex: 2,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "54".tr,
                          style: Get.textTheme.headlineSmall!.copyWith(
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        CustomWishlistButton(
                          name: "55".tr,
                          onTap: () {},
                        ),
                        CustomWishlistButton(
                          name: "56".tr,
                          onTap: () {},
                        ),
                      ],
                    ),
                    const SizedBox(height: AppSize.borderRaduis),
                    CustomTextFormField(
                      hintText: "39".tr,
                      keyboardType: TextInputType.text,
                      icon: Icons.search,
                      controller: controller.searchController,
                      validator: (valid) {
                        return null;
                      },
                    ),
                    const SizedBox(height: AppSize.lg),
                  ],
                ),
              ),
              Expanded(
                flex: 5,
                child: Obx(
                  () => ListView.separated(
                    physics: const BouncingScrollPhysics(),
                    itemCount: controller.favoriteShoes.length,
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: AppSize.borderRaduis),
                    itemBuilder: (context, index) {
                      ShoesModel shoes = controller.favoriteShoes[index];
                      return CustomCardShoesVertical(
                        picture: shoes.shoesPicture,
                        name:
                            "${translateDatabase(shoes.shoesName, shoes.shoesNameAr)}",
                        prise: shoes.shoesPrice,
                      );
                    },
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  margin: const EdgeInsets.symmetric(vertical: AppSize.fs2),
                  child: CustomPrimaryButton(
                    onPressed: () {},
                    title: "61".tr,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
