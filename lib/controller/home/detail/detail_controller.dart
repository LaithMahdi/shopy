import 'package:get/get.dart';
import 'package:shopy/core/class/status_request.dart';
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
}
