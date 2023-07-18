import 'package:get/get.dart';
import 'package:shopy/core/class/status_request.dart';
import 'package:shopy/core/constant/routes.dart';
import 'package:shopy/core/functions/get_snackbar.dart';
import 'package:shopy/core/functions/handle_data.dart';
import 'package:shopy/data/remote/authentification/forgot%20password/check_verify_code_data.dart';

abstract class RecoveryCodeController extends GetxController {
  goToNextNewPassword(String code);
  sendAgain();
}

class RecoveryCodeControllerImp extends RecoveryCodeController {
  late String email;
  StatusRequest? statusRequest;
  CheckVerifyCodeData checkVerifyCodeData = CheckVerifyCodeData(Get.find());
  @override
  void onInit() {
    // TODO: implement onInit
    email = Get.arguments["email"];
    print(email);
    super.onInit();
  }

  @override
  goToNextNewPassword(String code) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await checkVerifyCodeData.postData(email, code);

    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      print(response);
      if (response["message"] != null) {
        Get.offNamed(AppRoute.newPassword, arguments: {
          "email": email,
        });
      } else if (response["error"] == "Invalid verification code.") {
        getCustomSnackBar("26".tr, "27".tr, false);
        statusRequest = StatusRequest.failure;
      }
    } else {
      statusRequest = StatusRequest.failure;
    }
    update();
  }

  @override
  sendAgain() {}
}
