import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopy/controller/account/account_controller.dart';
import 'package:shopy/core/constant/app_size.dart';
import 'package:shopy/core/constant/color.dart';
import 'package:shopy/core/constant/image_asset.dart';
import 'package:shopy/view/widget/account/custom_button_account.dart';
import 'package:shopy/view/widget/account/custom_card_account.dart';
import 'package:shopy/view/widget/back_button.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AccountControllerImp controller = Get.put(AccountControllerImp());
    return Scaffold(
      appBar: AppBar(
        leading: const CustomBackButton(),
        title: Text("76".tr, style: Get.textTheme.displayLarge),
        backgroundColor: AppColor.primaryColorWhite,
        elevation: 0,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(
            horizontal: AppSize.paddingContentScreen),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Expanded(
            flex: 2,
            child: Column(
              children: [
                const SizedBox(height: AppSize.buttonPadding),
                CustomcardAccount(
                  picture: AppImageAsset.user,
                  name: "Laith Mahdi",
                  onTap: () {},
                ),
                const SizedBox(height: AppSize.paddingContentScreenMd),
              ],
            ),
          ),
          Expanded(
            flex: 8,
            child: ListView(
              physics: const BouncingScrollPhysics(),
              children: [
                const Divider(color: AppColor.primaryColorGrey2, thickness: 2),
                CustomButtonAccount(name: "78".tr, onTap: () {}),
                CustomButtonAccount(name: "79".tr, onTap: () {}),
                CustomButtonAccount(name: "80".tr, onTap: () {}),
                CustomButtonAccount(name: "81".tr, onTap: () {}),
                CustomButtonAccount(name: "82".tr, onTap: () {}),
                GetBuilder<AccountControllerImp>(
                  builder: (controller) => CustomButtonAccount(
                    name: "83".tr,
                    onTap: () => controller.changeLocale(),
                  ),
                ),
                CustomButtonAccount(name: "84".tr, onTap: () {}),
                CustomButtonAccount(
                  name: "85".tr,
                  onTap: () => controller.logout(),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
