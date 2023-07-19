import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopy/controller/checkout/checkout_controller.dart';
import 'package:shopy/core/constant/app_size.dart';
import 'package:shopy/core/constant/color.dart';
import 'package:shopy/core/constant/image_asset.dart';
import 'package:shopy/data/datasource/static/shoes_list.dart';
import 'package:shopy/data/model/shoes_model.dart';
import 'package:shopy/view/widget/authentification/custom_primary_button.dart';
import 'package:shopy/view/widget/back_button.dart';
import 'package:shopy/view/widget/wishlist/custom_card_shoes_vertical.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    CheckoutControllerImp controller = Get.put(CheckoutControllerImp());
    return Scaffold(
      appBar: AppBar(
        leading: const CustomBackButton(),
        title: Text("65".tr, style: Get.textTheme.displayLarge),
        backgroundColor: AppColor.primaryColorWhite,
        elevation: 0,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSize.paddingContentScreen,
        ),
        child: Column(children: [
          Expanded(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Divider(
                  color: AppColor.primaryColorGrey4,
                ),
                const SizedBox(height: AppSize.md),
                Text(
                  "Luka Marjanovic",
                  style: Get.textTheme.headlineLarge!.copyWith(
                    fontSize: 18,
                    color: AppColor.primaryColorGrey,
                  ),
                ),
                const SizedBox(height: AppSize.fs2),
                Text(
                  "221b Baker St, Marylebone\nLondon,\nUnited Kingdom",
                  style: Get.textTheme.headlineMedium!.copyWith(
                    fontWeight: FontWeight.w500,
                    color: AppColor.primaryColorGrey4,
                  ),
                ),
                const SizedBox(height: AppSize.md),
                const Divider(
                  color: AppColor.primaryColorGrey4,
                ),
                Row(
                  children: [
                    const SizedBox(height: AppSize.fs1),
                    Image.asset(AppImageAsset.master),
                    const SizedBox(width: AppSize.fs1),
                    Text(
                      "Master Card ending **68",
                      style: Get.textTheme.headlineMedium,
                    ),
                    const SizedBox(height: AppSize.fs1),
                  ],
                ),
                const Divider(
                  color: AppColor.primaryColorGrey4,
                ),
              ],
            ),
          ),
          Expanded(
            flex: 6,
            child: ListView(
              physics: const BouncingScrollPhysics(),
              children: const [
                // SizedBox(
                //   height: Get.height * 0.8,
                //   child: ListView.separated(
                //     physics: const NeverScrollableScrollPhysics(),
                //     itemBuilder: (context, index) {
                //       ShoesModel shoes = shoesList[index];
                //       return CustomCardShoesVertical(
                //         picture: shoes.picture,
                //         name: shoes.name,
                //         prise: shoes.prise,
                //       );
                //     },
                //     separatorBuilder: (context, index) =>
                //         const SizedBox(height: AppSize.md),
                //     itemCount: shoesList.length,
                //   ),
                // ),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Column(
              children: [
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
                  onPressed: () => controller.goToPaymentMethod(),
                  title: "66".tr,
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
