import 'package:shopy/api/end%20point/api_link.dart';
import 'package:shopy/core/class/crud.dart';

class SignUpData {
  Crud crud;
  SignUpData(this.crud);
  postData(name, email, password) async {
    var response = await crud.postData(ApiLink.postRegisterUser, {
      "name": name,
      "email": email,
      "password": password,
    });
    return response.fold((l) => l, (r) => r);
  }
}
