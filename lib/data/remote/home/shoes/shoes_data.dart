import 'package:shopy/api/end%20point/api_link.dart';
import 'package:shopy/core/class/crud.dart';

class ShoesData {
  Crud crud;

  ShoesData(this.crud);

  postData() async {
    var response = await crud.getData(ApiLink.getAllShoes);
    return response.fold((l) => [], (r) => r);
  }
}
