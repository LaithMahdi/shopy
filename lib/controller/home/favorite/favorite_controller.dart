import 'package:get/get.dart';
import 'package:shopy/core/functions/get_snackbar.dart';
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
    final message = isFavorite(shoeId) ? '99'.tr : '100'.tr;

    getCustomSnackBar(message, isFavorite(shoeId) ? "101".tr : "102".tr,
        isFavorite(shoeId) ? true : false);
  }

  bool isFavorite(int shoeId) {
    return favoriteShoesIds.contains(shoeId);
  }
}
