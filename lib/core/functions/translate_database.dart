import 'package:get/get.dart';
import 'package:shopy/core/services/my_services.dart';

translateDatabase(String en, String ar) {
  MyServices myServices = Get.find();
  if (myServices.sharedPreferences.getString("lang") == "en") {
    return en;
  } else {
    return ar;
  }
}
