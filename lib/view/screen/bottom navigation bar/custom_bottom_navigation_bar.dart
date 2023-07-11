import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:shopy/controller/bottom%20navigation%20bar/bottom_navigation_bar_controller.dart';
import 'package:shopy/core/constant/color.dart';
import 'package:shopy/core/constant/image_asset.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    BottomNavigationBarController controller =
        Get.put(BottomNavigationBarController());
    return Scaffold(
      body: controller.pages[controller.selectedTab],
      bottomNavigationBar: GetBuilder<BottomNavigationBarController>(
        builder: (controller) => BottomNavigationBar(
          currentIndex: controller.selectedTab,
          onTap: (index) => controller.changeTab(index),
          selectedItemColor: AppColor.primaryColorGrey3,
          unselectedItemColor: AppColor.primaryColorGrey4,
          items: [
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                AppImageAsset.home,
                color: controller.selectedTab == 0
                    ? AppColor.primaryColorGrey3
                    : AppColor.primaryColorGrey4,
              ),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                AppImageAsset.favorite,
                color: controller.selectedTab == 1
                    ? AppColor.primaryColorGrey3
                    : AppColor.primaryColorGrey4,
              ),
              label: "About",
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                AppImageAsset.shop,
                color: controller.selectedTab == 2
                    ? AppColor.primaryColorGrey3
                    : AppColor.primaryColorGrey4,
              ),
              label: "Product",
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                AppImageAsset.account,
                color: controller.selectedTab == 3
                    ? AppColor.primaryColorGrey3
                    : AppColor.primaryColorGrey4,
              ),
              label: "Contact",
            ),
          ],
        ),
      ),
    );
  }
}
