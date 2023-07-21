import 'package:get/get.dart';
import 'package:shopy/core/class/status_request.dart';
import 'package:shopy/core/functions/get_snackbar.dart';
import 'package:shopy/core/functions/handle_data.dart';
import 'package:shopy/core/services/my_services.dart';
import 'package:shopy/data/model/shoes_model.dart';
import 'package:shopy/data/remote/home/category/category_data.dart';

abstract class CategoryController extends GetxController {
  changeCategory(int index);
  getData(int id);
}

class CategoryControllerImp extends CategoryController {
  late int selCat;
  late List category;
  StatusRequest statusRequest = StatusRequest.none;
  List shoes = [];
  ShoesByCategoryData shoesByCategoryData = ShoesByCategoryData(Get.find());
  MyServices myServices = Get.find();
  String? lang;
  @override
  void onInit() {
    getArg();
    getData(selCat);
    super.onInit();
  }

  getArg() {
    selCat = Get.arguments["selCat"];
    category = Get.arguments["categories"];
    lang = myServices.sharedPreferences.getString("lang");
  }

  @override
  changeCategory(int index) {
    selCat = index;
    getData(selCat);
    update();
  }

  @override
  getData(id) async {
    statusRequest = StatusRequest.loading;
    update();

    var response = await shoesByCategoryData.postData(id);
    print(response);

    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response != null && response is List<dynamic>) {
        shoes.clear(); // Clear the list before populating it with new data
        shoes.addAll(response.map((item) => ShoesModel.fromJson(item)));
      } else if (response is Map &&
          response["error"] == "Category not found.") {
        getCustomSnackBar("26".tr, "27".tr, false);
        statusRequest = StatusRequest.failure;
      }
    } else {
      statusRequest = StatusRequest.failure;
    }
    update();
  }
}
