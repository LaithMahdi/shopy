class CategoryModel {
  int id;
  String categoryName;
  String categoryNameAr;
  String categoryPicture;
  DateTime categoryDate;

  CategoryModel({
    required this.id,
    required this.categoryName,
    required this.categoryNameAr,
    required this.categoryPicture,
    required this.categoryDate,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['id'],
      categoryName: json['category_name'],
      categoryNameAr: json['category_name_ar'],
      categoryPicture: json['category_picture'],
      categoryDate: DateTime.parse(json['category_date']),
    );
  }
}
