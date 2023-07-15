import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:shopy/controller/bottom%20navigation%20bar/bottom_navigation_bar_controller.dart';
import 'package:shopy/core/constant/color.dart';
import 'package:shopy/core/constant/image_asset.dart';
import 'package:shopy/view/screen/account/account_screen.dart';
import 'package:shopy/view/screen/cart/my_cart.dart';
import 'package:shopy/view/screen/home/home.dart';
import 'package:shopy/view/screen/wishlist/wishlist_screen.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final TextStyle unselectedLabelStyle = Get.textTheme.headlineSmall!.copyWith(
    fontWeight: FontWeight.w400,
  );

  final TextStyle selectedLabelStyle = Get.textTheme.headlineSmall!.copyWith(
    fontWeight: FontWeight.bold,
  );

  CustomBottomNavigationBar({super.key});

  Widget buildBottomNavigationMenu(
      context, BottomNavigationBarController landingPageController) {
    return Obx(() => Container(
          color: Colors.red,
          width: Get.width,
          height: 80,
          child: BottomNavigationBar(
            showUnselectedLabels: true,
            showSelectedLabels: true,
            onTap: landingPageController.changeTabIndex,
            currentIndex: landingPageController.tabIndex.value,
            unselectedItemColor: AppColor.primaryColorGrey4,
            selectedItemColor: AppColor.primaryColorGrey3,
            unselectedLabelStyle: unselectedLabelStyle,
            selectedLabelStyle: selectedLabelStyle,
            items: [
              BottomNavigationBarItem(
                label: "57".tr,
                icon: Container(
                  margin: const EdgeInsets.only(bottom: 7),
                  child: SvgPicture.asset(
                    AppImageAsset.home,
                    color: landingPageController.tabIndex.value == 0
                        ? AppColor.primaryColorGrey3
                        : AppColor.primaryColorGrey4,
                  ),
                ),
                backgroundColor: AppColor.primaryColorWhite,
              ),
              BottomNavigationBarItem(
                icon: Container(
                  margin: const EdgeInsets.only(bottom: 7),
                  child: SvgPicture.asset(
                    AppImageAsset.favorite,
                    color: landingPageController.tabIndex.value == 1
                        ? AppColor.primaryColorGrey3
                        : AppColor.primaryColorGrey4,
                  ),
                ),
                label: "53".tr,
                backgroundColor: AppColor.primaryColorWhite,
              ),
              BottomNavigationBarItem(
                icon: Container(
                  margin: const EdgeInsets.only(bottom: 7),
                  child: SvgPicture.asset(
                    AppImageAsset.shop,
                    color: landingPageController.tabIndex.value == 2
                        ? AppColor.primaryColorGrey3
                        : AppColor.primaryColorGrey4,
                  ),
                ),
                label: "58".tr,
                backgroundColor: AppColor.primaryColorWhite,
              ),
              BottomNavigationBarItem(
                icon: Container(
                  margin: const EdgeInsets.only(bottom: 7),
                  child: SvgPicture.asset(
                    AppImageAsset.account,
                    color: landingPageController.tabIndex.value == 3
                        ? AppColor.primaryColorGrey3
                        : AppColor.primaryColorGrey4,
                  ),
                ),
                label: "59".tr,
                backgroundColor: AppColor.primaryColorWhite,
              ),
            ],
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    final BottomNavigationBarController bottomNavigationBarController = Get.put(
      BottomNavigationBarController(),
      permanent: false,
    );
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: buildBottomNavigationMenu(
          context,
          bottomNavigationBarController,
        ),
        body: Obx(
          () => IndexedStack(
            index: bottomNavigationBarController.tabIndex.value,
            children: const [
              HomeScreen(),
              WishlistScreen(),
              MyCartScreen(),
              AccountScreen(),
            ],
          ),
        ),
      ),
    );
  }
}
