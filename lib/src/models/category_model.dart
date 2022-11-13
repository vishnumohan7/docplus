class CategoryModel {
  final String? id;
   String categoryName;
   String categoryCode;

  CategoryModel(
      {this.id, required this.categoryName, required this.categoryCode});
  factory CategoryModel.fromJSON(Map<String, dynamic> json) {
    return CategoryModel(
        id: json["_id"], categoryName: json["categoryName"], categoryCode: json["categoryCode"]);
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['categoryName'] = categoryName;
    map['categoryCode'] = categoryCode;
    return map;
  }
}
