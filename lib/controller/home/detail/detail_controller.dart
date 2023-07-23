import 'package:get/get.dart';
import 'package:shopy/core/class/status_request.dart';
import 'package:shopy/core/constant/routes.dart';
import 'package:shopy/core/functions/get_snackbar.dart';
import 'package:shopy/core/functions/handle_data.dart';
import 'package:shopy/data/model/shoes_model.dart';
import 'package:shopy/data/remote/home/detail/detail_data.dart';

abstract class DetailController extends GetxController {
  getData();
}

class DetailControllerImp extends DetailController {
  StatusRequest? statusRequest;
  DetailData detailData = DetailData(Get.find());
  RxInt counter = RxInt(1);
  late RxDouble prise;
  ShoesModel? shoesModel;
  late int id;
  List<bool> tapedSize = [false, false, false, false, false];
  int currentlyTappedIndex = -1;

  List<String> size = ["US 4", "US 4.5", "US 5", "US 5.5", "US 6"];

  @override
  void onInit() {
    // TODO: implement onInit
    id = Get.arguments['id'];
    getData();
    super.onInit();
  }

  onAdd() {
    counter.value++;
    prise.value = shoesModel!.shoesPrice * counter.value;
  }

  onMinus() {
    if (counter.value > 1) {
      counter.value--;
      prise.value = shoesModel!.shoesPrice * counter.value;
    }
  }

  @override
  getData() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await detailData.postData(id);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response != null && response.containsKey("id")) {
        shoesModel = ShoesModel.fromJson(response);
        prise = RxDouble(shoesModel!.shoesPrice);
      } else if (response != null && response["detail"] == "Not found.") {
        getCustomSnackBar("26".tr, "Not found.".tr, false);
        statusRequest = StatusRequest.failure;
      }
    } else {
      statusRequest = StatusRequest.failure;
    }
    update();
  }

  void changeTapedSize(int i) {
    for (int index = 0; index < tapedSize.length; index++) {
      if (index == i) {
        tapedSize[index] = true;
        currentlyTappedIndex = index;
      } else {
        tapedSize[index] = false;
      }
    }
    update();
  }

  goToCheckout() {
    Get.toNamed(AppRoute.paymentMethod);
  }
}
