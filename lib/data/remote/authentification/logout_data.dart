import 'package:shopy/api/end%20point/api_link.dart';
import 'package:shopy/core/class/crud.dart';

class LogoutData {
  Crud crud;

  LogoutData(this.crud);

  postData() async {
    var response = await crud.postData(ApiLink.logout, {});
    return response.fold((l) => l, (r) => r);
  }
}
