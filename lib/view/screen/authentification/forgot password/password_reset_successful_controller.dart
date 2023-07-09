import 'package:get/get.dart';
import 'package:shopy/core/constant/routes.dart';

abstract class PasswordResetSuccessfulController extends GetxController {
  goToSignIn();
}

class PasswordResetSuccessfulControllerImp
    extends PasswordResetSuccessfulController {
  @override
  goToSignIn() => Get.offAllNamed(AppRoute.login);
}
