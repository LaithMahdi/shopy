import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopy/core/class/status_request.dart';
import 'package:shopy/core/functions/get_snackbar.dart';
import 'package:shopy/core/functions/handle_data.dart';
import 'package:shopy/data/model/shoes_model.dart';
import 'package:shopy/data/remote/home/shoes/shoes_data.dart';
import '../home/favorite/favorite_controller.dart';

abstract class WishlistController extends GetxController {
  void getFavoriteShoes();
}

class WishlistControllerImp extends WishlistController {
  ShoesData shoesData = ShoesData(Get.find());
  late TextEditingController searchController;

  StatusRequest statusRequest = StatusRequest.none;
  final RxList<ShoesModel> favoriteShoes = <ShoesModel>[].obs;
  final FavoriteController favoriteController = Get.find<FavoriteController>();

  @override
  void onInit() {
    searchController = TextEditingController();

    getFavoriteShoes();
    super.onInit();
  }

  @override
  void getFavoriteShoes() async {
    final List<int> favoriteShoeIds = favoriteController.favoriteShoesIds;
    final List<dynamic> response = await shoesData.postData();

    if (response.isNotEmpty) {
      List<ShoesModel> allShoes =
          response.map((data) => ShoesModel.fromJson(data)).toList();
      favoriteShoes.value = allShoes
          .where((shoes) => favoriteShoeIds.contains(shoes.id))
          .toList();
    } else {
      favoriteShoes.clear(); // Clear the list if the response is empty
    }
  }

  getData() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await shoesData.postData();
    List<ShoesModel> allShoes = []; // Declare and initialize allShoes list

    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response is List) {
        allShoes = response.map((e) => ShoesModel.fromJson(e)).toList();
        // or use the following if statement to handle the empty response
        // if (response.isNotEmpty) {
        //   allShoes = response.map((e) => ShoesModel.fromJson(e)).toList();
        // } else {
        //   getCustomSnackBar("26".tr, "27".tr, false);
        //   statusRequest = StatusRequest.failure;
        // }
      } else if (response["error"]) {
        getCustomSnackBar("26".tr, "27".tr, false);
        statusRequest = StatusRequest.failure;
      }
    } else {
      statusRequest = StatusRequest.failure;
    }
    update();
  }
}
