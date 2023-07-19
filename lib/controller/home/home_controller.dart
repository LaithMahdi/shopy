import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopy/core/class/status_request.dart';
import 'package:shopy/core/functions/get_snackbar.dart';
import 'package:shopy/core/functions/handle_data.dart';
import 'package:shopy/data/remote/home/home_data.dart';

abstract class HomeController extends GetxController {
  getData();
}

class HomeControllerImpl extends HomeController {
  final List category = [];
  final List shoes = [];
  HomeData homeData = HomeData(Get.find());
  StatusRequest? statusRequest;
  late TextEditingController searchController;
  @override
  void onInit() {
    // TODO: implement onInit
    searchController = TextEditingController();
    getData();
    super.onInit();
  }

  @override
  getData() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await homeData.postData();

    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      print(response);
      if (response["message"] == "success") {
        category.addAll(response["categories"]);
        shoes.addAll(response["shoes_with_discount"]);
      } else if (response["error"] == "Invalid verification code.") {
        getCustomSnackBar("26".tr, "27".tr, false);
        statusRequest = StatusRequest.failure;
      }
    } else {
      statusRequest = StatusRequest.failure;
    }
    update();
  }
}
