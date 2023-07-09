import 'package:get/get.dart';
import 'package:shopy/core/constant/routes.dart';

abstract class ForgotPasswordController extends GetxController {
  goToSendViaSms();
  goToSendViaMail();
}

class ForgotPasswordControllerImp extends ForgotPasswordController {
  @override
  goToSendViaMail() => Get.toNamed(AppRoute.recoveryCode);

  @override
  goToSendViaSms() => Get.toNamed(AppRoute.recoveryCode);
}
