import 'package:shopy/api/end%20point/api_link.dart';

import '../../../core/class/crud.dart';

class HomeData {
  Crud crud;

  HomeData(this.crud);

  postData() async {
    var response = await crud.getData(ApiLink.getHomePage);
    return response.fold((l) => l, (r) => r);
  }
}
