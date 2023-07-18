import 'package:shopy/api/end%20point/api_link.dart';
import 'package:shopy/core/class/crud.dart';

class RestPasswordData {
  Crud crud;
  RestPasswordData(this.crud);
  postData(String email, String password) async {
    var response = await crud.postData(ApiLink.postRestPassword, {
      "email": email,
      "password": password,
    });
    return response.fold((l) => l, (r) => r);
  }
}
