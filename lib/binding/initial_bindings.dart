import 'package:get/get.dart';
import 'package:shopy/controller/home/favorite/favorite_controller.dart';
import 'package:shopy/core/class/crud.dart';

class InitialBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(Crud());
    Get.lazyPut<FavoriteController>(() => FavoriteController());
    // Get.put<WishlistController>(WishlistControllerImp());
  }
}
