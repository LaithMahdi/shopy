import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class MyCartController extends GetxController {}

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
}
