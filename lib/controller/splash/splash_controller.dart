import 'package:get/get.dart';
import 'package:shopy/core/constant/routes.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    Future.delayed(
        const Duration(seconds: 2), () => Get.offAllNamed(AppRoute.login));
    super.onInit();
  }
}
