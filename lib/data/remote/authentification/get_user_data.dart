import 'package:shopy/api/end%20point/api_link.dart';

import '../../../core/class/crud.dart';

class GetUserData {
  Crud crud;

  GetUserData(this.crud);

  getData(String token) async {
    var response = await crud.getData(ApiLink.getUser, headers: {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json',
      // Add other headers as needed
    });
    return response.fold((l) => l, (r) => r);
  }
}
