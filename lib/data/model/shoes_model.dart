import 'package:shopy/data/model/category_model.dart';

class ShoesModel {
  int id;
  CategoryModel category;
  String shoesName;
  String shoesNameAr;
  String shoesDescription;
  String shoesDescriptionAr;
  String shoesPicture;
  double shoesPrice;
  int shoesDiscount;
  DateTime shoesDate;

  ShoesModel({
    required this.id,
    required this.category,
    required this.shoesName,
    required this.shoesNameAr,
    required this.shoesDescription,
    required this.shoesDescriptionAr,
    required this.shoesPicture,
    required this.shoesPrice,
    required this.shoesDiscount,
    required this.shoesDate,
  });

  factory ShoesModel.fromJson(Map<String, dynamic> json) {
    return ShoesModel(
      id: json['id'],
      category: CategoryModel.fromJson(json['category']),
      shoesName: json['shoes_name'],
      shoesNameAr: json['shoes_name_ar'],
      shoesDescription: json['shoes_description'],
      shoesDescriptionAr: json['shoes_description_ar'],
      shoesPicture: json['shoes_picture'],
      shoesPrice: json['shoes_price'].toDouble(),
      shoesDiscount: json['shoes_discount'],
      shoesDate: DateTime.parse(json['shoes_date']),
    );
  }
}
