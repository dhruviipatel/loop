import 'dart:convert';

SearchingModel searchingModelFromJson(String str) =>
    SearchingModel.fromJson(json.decode(str));

String searchingModelToJson(SearchingModel data) => json.encode(data.toJson());

class SearchingModel {
  bool success;
  List<Search> data;
  String message;

  SearchingModel({
    required this.success,
    required this.data,
    required this.message,
  });

  factory SearchingModel.fromJson(Map<String, dynamic> json) => SearchingModel(
        success: json["success"],
        data: List<Search>.from(json["data"].map((x) => Search.fromJson(x))),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "message": message,
      };
}

class Search {
  int id;
  String name;
  String email;
  dynamic emailVerifiedAt;
  int isAdmin;
  dynamic countryCode;
  dynamic mobile;
  dynamic facebookId;
  dynamic googleId;
  dynamic socialType;
  DateTime dob;
  int? gender;
  int isActive;
  dynamic accessToken;
  dynamic deviceType;
  dynamic deviceToken;
  String profileImage;
  String createdAt;
  String updatedAt;
  dynamic deletedAt;
  int isBlocked;
  String? identify;
  String profilePhotoUrl;
  int following;
  int follower;

  Search({
    required this.id,
    required this.name,
    required this.email,
    this.emailVerifiedAt,
    required this.isAdmin,
    this.countryCode,
    this.mobile,
    this.facebookId,
    this.googleId,
    this.socialType,
    required this.dob,
    this.gender,
    required this.isActive,
    this.accessToken,
    this.deviceType,
    this.deviceToken,
    required this.profileImage,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
    required this.isBlocked,
    this.identify,
    required this.profilePhotoUrl,
    required this.following,
    required this.follower,
  });

  factory Search.fromJson(Map<String, dynamic> json) => Search(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        emailVerifiedAt: json["email_verified_at"],
        isAdmin: json["is_admin"],
        countryCode: json["country_code"],
        mobile: json["mobile"],
        facebookId: json["facebook_id"],
        googleId: json["google_id"],
        socialType: json["social_type"],
        dob: DateTime.parse(json["dob"]),
        gender: json["gender"],
        isActive: json["is_active"],
        accessToken: json["access_token"],
        deviceType: json["device_type"],
        deviceToken: json["device_token"],
        profileImage: json["profile_image"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        deletedAt: json["deleted_at"],
        isBlocked: json["is_blocked"],
        identify: json["identify"],
        profilePhotoUrl: json["profile_photo_url"],
        following: json["following"],
        follower: json["follower"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "email_verified_at": emailVerifiedAt,
        "is_admin": isAdmin,
        "country_code": countryCode,
        "mobile": mobile,
        "facebook_id": facebookId,
        "google_id": googleId,
        "social_type": socialType,
        "dob":
            "${dob.year.toString().padLeft(4, '0')}-${dob.month.toString().padLeft(2, '0')}-${dob.day.toString().padLeft(2, '0')}",
        "gender": gender,
        "is_active": isActive,
        "access_token": accessToken,
        "device_type": deviceType,
        "device_token": deviceToken,
        "profile_image": profileImage,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "deleted_at": deletedAt,
        "is_blocked": isBlocked,
        "identify": identify,
        "profile_photo_url": profilePhotoUrl,
        "following": following,
        "follower": follower,
      };
}
