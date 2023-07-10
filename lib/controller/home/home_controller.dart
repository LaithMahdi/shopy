import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class HomeController extends GetxController {}

class HomeControllerImpl extends HomeController {
  late TextEditingController searchController;
  @override
  void onInit() {
    // TODO: implement onInit
    searchController = TextEditingController();
    super.onInit();
  }
}
