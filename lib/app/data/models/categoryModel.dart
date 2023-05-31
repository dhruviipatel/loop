import 'dart:convert';

Cata categoryFromJson(String str) => Cata.fromJson(json.decode(str));

String categoryToJson(Cata data) => json.encode(data.toJson());

class Cata {
  List<Category> data;

  Cata({required this.data});

  factory Cata.fromJson(Map<String, dynamic> json) => Cata(
      data: List<Category>.from(json["data"].map((x) => Category.fromJson(x))));

  Map<String, dynamic> toJson() =>
      {"data": List<dynamic>.from(data.map((x) => x.toJson()))};
}

class Category {
  int categoryId;
  String name;
  String image;
  int isActive;

  int orderBy;

  Category({
    required this.categoryId,
    required this.name,
    required this.image,
    required this.isActive,
    required this.orderBy,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        categoryId: json["category_id"],
        name: json["name"],
        image: json["image"],
        isActive: json["is_active"],
        orderBy: json["order_by"],
      );

  Map<String, dynamic> toJson() => {
        "category_id": categoryId,
        "name": name,
        "image": image,
        "is_active": isActive,
        "order_by": orderBy,
      };
}

class CategoryModel {
  static List<Category> catagoryItem = [
    Category(
        categoryId: 1,
        name: "PUBG",
        image: "https://looptest.inventdi.com/storage/categories/all_cat.png",
        isActive: 1,
        orderBy: 1)
  ];
}
