import 'package:shopy/api/end%20point/api_link.dart';
import 'package:shopy/core/class/crud.dart';

class SendVerifyCode {
  Crud crud;

  SendVerifyCode(this.crud);

  postData(String email) async {
    var response =
        await crud.postData(ApiLink.postSendVerifyCode, {"email": email});
    return response.fold((l) => l, (r) => r);
  }
}
