import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:shopy/core/constant/routes.dart';
import 'package:shopy/core/services/my_services.dart';

class OnboardingMiddleware extends GetMiddleware {
  @override
  int? get priority => 1;
  MyServices myServices = Get.find();

  @override
  RouteSettings? redirect(String? route) {
    if (myServices.sharedPreferences.getBool("onboarding") == true) {
      return const RouteSettings(name: AppRoute.login);
    }
    return null;
  }
}
