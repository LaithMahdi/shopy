import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:shopy/core/constant/routes.dart';
import 'package:shopy/core/services/my_services.dart';

class HomeMiddleware extends GetMiddleware {
  @override
  int? get priority => 2;
  MyServices myServices = Get.find();

  @override
  RouteSettings? redirect(String? route) {
    if (myServices.sharedPreferences.getString("token") != null) {
      return const RouteSettings(name: AppRoute.bottomNavigationBar);
    }
    return null;
  }
}
