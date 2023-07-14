import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopy/core/constant/routes.dart';

abstract class MyCartController extends GetxController {
  goToCheckout();
}

class MyCartControllerImp extends MyCartController {
  late TextEditingController searchController;
  late TextEditingController couponController;
  @override
  void onInit() {
    // TODO: implement onInit
    searchController = TextEditingController();
    couponController = TextEditingController();
    super.onInit();
  }

  @override
  goToCheckout() => Get.toNamed(AppRoute.checkout);
}
