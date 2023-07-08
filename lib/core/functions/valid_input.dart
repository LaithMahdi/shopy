import 'package:get/get.dart';

validInput(String val, int min, int max, String type) {
  if (type == "username") {
    if (!GetUtils.isUsername(val)) {
      return "13".tr;
    }
  }
  if (type == "email") {
    if (!GetUtils.isEmail(val)) {
      return "14".tr;
    }
  }

  if (val.isEmpty) {
    return "15".tr;
  }

  if (val.length < min) {
    return "${"16".tr} $min";
  }

  if (val.length > max) {
    return "${"17".tr} $max";
  }
}
