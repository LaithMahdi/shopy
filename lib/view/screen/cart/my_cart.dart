import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopy/controller/cart/my_cart_controller.dart';
import 'package:shopy/core/constant/app_size.dart';
import 'package:shopy/core/constant/color.dart';
import 'package:shopy/data/datasource/static/shoes_list.dart';
import 'package:shopy/data/model/shoes_model.dart';
import 'package:shopy/view/widget/authentification/custom_primary_button.dart';
import 'package:shopy/view/widget/authentification/custom_text_form_field.dart';
import 'package:shopy/view/widget/back_button.dart';
import 'package:shopy/view/widget/wishlist/custom_card_shoes_vertical.dart';

class MyCartScreen extends StatelessWidget {
  const MyCartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    MyCartControllerImp controller = Get.put(MyCartControllerImp());
    return Scaffold(
      appBar: AppBar(
        leading: const CustomBackButton(),
        title: Text("58".tr, style: Get.textTheme.displayLarge),
        backgroundColor: AppColor.primaryColorWhite,
        elevation: 0,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSize.paddingContentScreen,
        ),
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: ListView(
                children: [
                  Text(
                    "60".tr,
                    style: Get.textTheme.headlineSmall!.copyWith(
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                    ),
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
                  const SizedBox(height: AppSize.paddingBetween),
                ],
              ),
            ),
            Expanded(
              flex: 6,
              child: ListView(
                physics: const BouncingScrollPhysics(),
                children: [
                  SizedBox(
                    height: Get.height * 0.8,
                    child: ListView.separated(
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        ShoesModel shoes = shoesList[index];
                        return CustomCardShoesVertical(
                          picture: shoes.picture,
                          name: shoes.name,
                          prise: shoes.prise,
                        );
                      },
                      separatorBuilder: (context, index) =>
                          const SizedBox(height: AppSize.md),
                      itemCount: shoesList.length,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 3,
              child: ListView(
                children: [
                  Row(
                    children: [
                      Expanded(
                        flex: 4,
                        child: CustomTextFormField(
                          hintText: "63".tr,
                          keyboardType: TextInputType.text,
                          controller: controller.couponController,
                          validator: (valid) {
                            return null;
                          },
                        ),
                      ),
                      const SizedBox(width: AppSize.buttonPadding),
                      Expanded(
                        flex: 2,
                        child: CustomPrimaryButton(
                          onPressed: () {},
                          title: "62".tr,
                          color: AppColor.primaryColorGrey2,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: AppSize.fs1),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "64".tr,
                        style: Get.textTheme.headlineLarge!.copyWith(
                          color: AppColor.primaryColorGrey,
                        ),
                      ),
                      Text(
                        "\$282.00",
                        style: Get.textTheme.headlineLarge!.copyWith(
                          color: AppColor.primaryColorGrey,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: AppSize.md),
                  CustomPrimaryButton(
                    onPressed: () => controller.goToCheckout(),
                    title: "65".tr,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
