import 'package:shopy/api/end%20point/api_link.dart';
import 'package:shopy/core/class/crud.dart';

class FavoriteData {
  Crud crud;

  FavoriteData(this.crud);

  postData(int userId, int shoesId) async {
    var response = await crud.postData(ApiLink.postFavorite, {
      "user": userId,
      "shoes": shoesId,
    });
    return response.fold((l) => l, (r) => r);
  }

  getData(int userId) async {
    var response = await crud.getData(ApiLink.getUserFavorites(userId));
    return response.fold((l) => l, (r) => r);
  }

  deleteData(int userId, int shoesId) async {
    var response = await crud.deleteData(ApiLink.deleteFavorite(shoesId));
    return response.fold((l) => l, (r) => r);
  }
}
