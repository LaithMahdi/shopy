import 'package:shopy/api/end%20point/api_link.dart';
import 'package:shopy/core/class/crud.dart';

class CheckVerifyCodeData {
  Crud crud;

  CheckVerifyCodeData(this.crud);

  postData(String email, String verifyCode) async {
    var response = await crud.postData(ApiLink.postCheckVerifyCode, {
      "email": email,
      "verify_code": verifyCode,
    });
    return response.fold((l) => l, (r) => r);
  }
}
