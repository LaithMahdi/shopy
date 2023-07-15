import 'package:get/get.dart';
import 'package:shopy/core/constant/routes.dart';
import 'package:shopy/core/services/my_services.dart';

abstract class AccountController extends GetxController {
  void logout();
}

class AccountControllerImp extends AccountController {
  MyServices services = Get.find();
  @override
  void logout() async {
    await services.sharedPreferences.setBool("isLogin", false);
    Get.offAllNamed(AppRoute.login);
  }
}
