import 'package:get/get.dart';
import 'package:shopy/core/constant/routes.dart';

abstract class CheckoutController extends GetxController {
  goToPaymentMethod();
}

class CheckoutControllerImp extends CheckoutController {
  @override
  goToPaymentMethod() => Get.toNamed(AppRoute.paymentMethod);
}
