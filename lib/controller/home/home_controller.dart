import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopy/core/class/status_request.dart';
import 'package:shopy/core/constant/routes.dart';
import 'package:shopy/core/functions/get_snackbar.dart';
import 'package:shopy/core/functions/handle_data.dart';
import 'package:shopy/core/services/my_services.dart';
import 'package:shopy/data/model/category_model.dart';
import 'package:shopy/data/model/shoes_model.dart';
import 'package:shopy/data/remote/home/home_data.dart';

abstract class HomeController extends GetxController {
  getData();
  goToCategoryScreen(int selCat);
}

class HomeControllerImpl extends HomeController {
  final List<CategoryModel> category = [];
  final List<ShoesModel> shoes = [];
  HomeData homeData = HomeData(Get.find());
  MyServices myServices = Get.find();
  StatusRequest? statusRequest;
  late TextEditingController searchController;
  String? lang;
  @override
  void onInit() {
    // TODO: implement onInit
    searchController = TextEditingController();
    getData();
    lang = myServices.sharedPreferences.getString("lang");
    super.onInit();
  }

  @override
  getData() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await homeData.postData();

    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response["message"] == "success") {
        category.addAll(List.generate(
          response["categories"].length,
          (index) => CategoryModel.fromJson(response["categories"][index]),
        ));
        shoes.addAll(List.generate(
            response["shoes_with_discount"].length,
            (index) =>
                ShoesModel.fromJson(response["shoes_with_discount"][index])));
      } else if (response["error"] == "Invalid verification code.") {
        getCustomSnackBar("26".tr, "27".tr, false);
        statusRequest = StatusRequest.failure;
      }
    } else {
      statusRequest = StatusRequest.failure;
    }
    update();
  }

  @override
  goToCategoryScreen(selCat) {
    Get.toNamed(AppRoute.category,
        arguments: {"selCat": selCat, "categories": category});
  }
}
