import 'package:shopy/api/end%20point/api_link.dart';
import 'package:shopy/core/class/crud.dart';

class SearchData {
  Crud crud;

  SearchData(this.crud);

  postData(String textSearch) async {
    var response = await crud.getData(ApiLink.search(textSearch));
    return response.fold((l) => [], (r) => r);
  }
}
