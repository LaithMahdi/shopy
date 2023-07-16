import 'package:shopy/api/end%20point/api_link.dart';
import 'package:shopy/core/class/crud.dart';

class SignInData {
  Crud crud;

  SignInData(this.crud);

  postData(String email, String password) async {
    var response = await crud.postData(ApiLink.postLogin, {
      "email": email,
      "password": password,
    });
    return response.fold((l) => l, (r) => r);
  }
}
