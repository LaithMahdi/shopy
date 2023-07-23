import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopy/core/class/status_request.dart';
import 'package:shopy/core/constant/app_size.dart';
import 'package:shopy/core/constant/color.dart';
import 'package:shopy/core/constant/routes.dart';
import 'package:shopy/core/functions/get_snackbar.dart';
import 'package:shopy/core/functions/handle_data.dart';
import 'package:shopy/core/localization/changelocal.dart';
import 'package:shopy/core/services/my_services.dart';
import 'package:shopy/data/datasource/sqflite/database_heleper.dart';
import 'package:shopy/data/remote/authentification/logout_data.dart';
import 'package:shopy/view/widget/authentification/custom_primary_button.dart';

abstract class AccountController extends GetxController {
  void logout();
  void changeLocale();
}

class AccountControllerImp extends AccountController {
  MyServices services = Get.find();
  LocaleController localeController = Get.find();
  String? name = "";
  StatusRequest statusRequest = StatusRequest.none;
  LogoutData logoutData = LogoutData(Get.find());
  DatabaseHelper database = DatabaseHelper();
  @override
  void onInit() async {
    name = services.sharedPreferences.getString("name");
    super.onInit();
  }

  void clearData() async {
    await services.sharedPreferences.remove("token");
    await services.sharedPreferences.remove("name");
    await services.sharedPreferences.remove("id");
    await services.sharedPreferences.remove("email");
    database.deleteDatabase();
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
                    update();
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
                    update();
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
  }

  @override
  void logout() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await logoutData.postData();
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response["status"] == "success") {
        clearData();

        Get.offAllNamed(AppRoute.login);
      } else {
        getCustomSnackBar("89".tr, "91".tr, false);
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }
}
