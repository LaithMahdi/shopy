import 'package:shopy/api/end%20point/api_link.dart';
import 'package:shopy/core/class/crud.dart';

class ShoesByCategoryData {
  Crud crud;

  ShoesByCategoryData(this.crud);

  postData(int id) async {
    var response = await crud.getData(ApiLink.getShoesByCategory(id));
    return response.fold((l) => l, (r) => r);
  }
}
