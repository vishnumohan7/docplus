
class CategoryModel {
  final String id;
  final String categoryName;
  final String categoryCode;

  CategoryModel(this.id, this.categoryName, this.categoryCode);
  factory CategoryModel.fromJSON(Map<String, dynamic> json) {
    return CategoryModel(
        json["_id"], json["categoryName"], json["categoryCode"]);
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['categoryName'] = categoryName;
    map['categoryCode'] = categoryCode;
    return map;
  }
}
