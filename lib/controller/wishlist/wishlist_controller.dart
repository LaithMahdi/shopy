import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class WishlistController extends GetxController {}

class WishlistControllerImp extends WishlistController {
  late TextEditingController searchController;
  @override
  void onInit() {
    // TODO: implement onInit
    searchController = TextEditingController();
    super.onInit();
  }
}
