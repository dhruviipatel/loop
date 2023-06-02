// To parse this JSON data, do
//
//     final searchUser = searchUserFromJson(jsonString);

import 'dart:convert';

SearchUser searchUserFromJson(String str) =>
    SearchUser.fromJson(json.decode(str));

String searchUserToJson(SearchUser data) => json.encode(data.toJson());

class SearchUser {
  bool success;
  List<FoundUser> data;
  String message;

  SearchUser({
    required this.success,
    required this.data,
    required this.message,
  });

  factory SearchUser.fromJson(Map<String, dynamic> json) => SearchUser(
        success: json["success"],
        data: List<FoundUser>.from(
            json["data"].map((x) => FoundUser.fromJson(x))),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "message": message,
      };
}

class FoundUser {
  int id;
  String? name;
  String email;
  int? mobile;
  String? profile_Image;

  FoundUser({
    required this.id,
    this.name,
    required this.email,
    this.mobile,
    this.profile_Image,
  });

  factory FoundUser.fromJson(Map<String, dynamic> json) => FoundUser(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        mobile: json["mobile"],
        profile_Image: json["profile_image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "mobile": mobile,
        "profile_image": profile_Image,
      };
}

class SearchModel {
  static List<FoundUser> catagoryItem = [
    FoundUser(
        id: 3,
        name: "test user",
        email: "akshaytestusser@gmail.com",
        mobile: 9978945895,
        profile_Image: "")
  ];
}
