import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopy/data/datasource/sqflite/database_heleper.dart';

class FavoriteController extends GetxController {
  final RxList<int> favoriteShoesIds = RxList<int>();
  final DatabaseHelper _dbHelper = DatabaseHelper();

  @override
  void onInit() {
    super.onInit();
    _loadFavoriteShoesIds();
  }

  void _loadFavoriteShoesIds() async {
    final favoriteShoeIds = await _dbHelper.getFavoriteShoeIds();
    favoriteShoesIds.addAll(favoriteShoeIds);
  }

  void toggleFavorite(int shoeId) async {
    if (favoriteShoesIds.contains(shoeId)) {
      favoriteShoesIds.remove(shoeId);
      await _dbHelper.deleteFavoriteShoe(shoeId);
    } else {
      favoriteShoesIds.add(shoeId);
      await _dbHelper.insertFavoriteShoe(shoeId);
    }
    update();
    showFavoriteSnackbar(shoeId);
  }

  void showFavoriteSnackbar(int shoeId) {
    final message =
        isFavorite(shoeId) ? 'Added to favorites' : 'Removed from favorites';
    Get.snackbar(
      'Favorite',
      message,
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(seconds: 2),
      backgroundColor: Colors.grey, // Customize the background color if needed
      colorText: Colors.white, // Customize the text color if needed
    );
  }

  bool isFavorite(int shoeId) {
    return favoriteShoesIds.contains(shoeId);
  }
}
