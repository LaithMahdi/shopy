import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopy/core/constant/app_size.dart';
import 'package:shopy/core/constant/color.dart';
import 'package:shopy/core/constant/routes.dart';
import 'package:shopy/core/localization/changelocal.dart';
import 'package:shopy/core/services/my_services.dart';
import 'package:shopy/view/widget/authentification/custom_primary_button.dart';

abstract class AccountController extends GetxController {
  void logout();
  void changeLocale();
}

class AccountControllerImp extends AccountController {
  MyServices services = Get.find();
  LocaleController localeController = Get.find();
  @override
  void logout() async {
    await services.sharedPreferences.setBool("isLogin", false);
    Get.offAllNamed(AppRoute.login);
  }

  @override
  void changeLocale() {
    Get.defaultDialog(
      title: "86".tr,
      titleStyle: Get.textTheme.headlineLarge!.copyWith(
        color: AppColor.primaryColorBlack,
      ),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("87".tr),
          const SizedBox(height: AppSize.md),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: CustomPrimaryButton(
                  onPressed: () async {
                    localeController.changeLang("ar");
                    await services.sharedPreferences.setString("locale", "ar");

                    Get.back();
                  },
                  title: "19".tr,
                  fontSize: true,
                ),
              ),
              const SizedBox(width: AppSize.fs2),
              Expanded(
                child: CustomPrimaryButton(
                  onPressed: () async {
                    localeController.changeLang("en");
                    await services.sharedPreferences.setString("locale", "en");
                    Get.back();
                  },
                  title: "20".tr,
                  fontSize: true,
                ),
              ),
            ],
          ),
        ],
      ),
    );

    //localeController.changeLang("en");
  }
}
