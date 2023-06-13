// To parse this JSON data, do
//
//     final followingModel = followingModelFromJson(jsonString);

import 'dart:convert';

FollowingModel followingModelFromJson(String str) =>
    FollowingModel.fromJson(json.decode(str));

String followingModelToJson(FollowingModel data) => json.encode(data.toJson());

class FollowingModel {
  bool success;
  List<Following> data;
  String message;

  FollowingModel({
    required this.success,
    required this.data,
    required this.message,
  });

  factory FollowingModel.fromJson(Map<String, dynamic> json) => FollowingModel(
        success: json["success"],
        data: List<Following>.from(
            json["data"].map((x) => Following.fromJson(x))),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "message": message,
      };
}

class Following {
  int followingId;
  int customerId;
  int followingCustomerId;
  int isAccept;
  String createdAt;
  String updatedAt;
  FollowingCustomer? followingCustomer;

  Following({
    required this.followingId,
    required this.customerId,
    required this.followingCustomerId,
    required this.isAccept,
    required this.createdAt,
    required this.updatedAt,
    required this.followingCustomer,
  });

  factory Following.fromJson(Map<String, dynamic> json) => Following(
        followingId: json["following_id"],
        customerId: json["customer_id"],
        followingCustomerId: json["following_customer_id"],
        isAccept: json["is_accept"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        followingCustomer: json["following_customer"] != null &&
                json["following_customer"] is Map<String, dynamic>
            ? FollowingCustomer.fromJson(json["following_customer"])
            : null,
      );

  Map<String, dynamic> toJson() => {
        "following_id": followingId,
        "customer_id": customerId,
        "following_customer_id": followingCustomerId,
        "is_accept": isAccept,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "following_customer": followingCustomer!.toJson(),
      };
}

class FollowingCustomer {
  int id;
  String name;
  String email;
  dynamic emailVerifiedAt;
  int isAdmin;
  dynamic countryCode;
  dynamic mobile;
  String? facebookId;
  dynamic googleId;
  String? socialType;
  DateTime? dob;
  int gender;
  int isActive;
  dynamic accessToken;
  dynamic deviceType;
  String? deviceToken;
  String profileImage;
  String createdAt;
  String updatedAt;
  dynamic deletedAt;
  int isBlocked;
  String? identify;
  String profilePhotoUrl;
  int following;
  int follower;

  FollowingCustomer({
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
    this.dob,
    required this.gender,
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

  factory FollowingCustomer.fromJson(Map<String, dynamic> json) =>
      FollowingCustomer(
        id: json["id"] ?? 0,
        name: json["name"] ?? '',
        email: json["email"] ?? '',
        emailVerifiedAt: json["email_verified_at"],
        isAdmin: json["is_admin"] ?? 0,
        countryCode: json["country_code"] ?? "",
        mobile: json["mobile"],
        facebookId: json["facebook_id"] ?? "",
        googleId: json["google_id"],
        socialType: json["social_type"] ?? "",
        dob: json["dob"] == null ? null : DateTime.parse(json["dob"]),
        gender: json["gender"] ?? 0,
        isActive: json["is_active"] ?? 0,
        accessToken: json["access_token"] ?? "",
        deviceType: json["device_type"],
        deviceToken: json["device_token"],
        profileImage: json["profile_image"] ?? '',
        createdAt: json["created_at"] ?? "",
        updatedAt: json["updated_at"] ?? "",
        deletedAt: json["deleted_at"] ?? "",
        isBlocked: json["is_blocked"] ?? 0,
        identify: json["identify"] ?? "",
        profilePhotoUrl: json["profile_photo_url"] ?? "",
        following: json["following"] ?? 0,
        follower: json["follower"] ?? 0,
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
            "${dob!.year.toString().padLeft(4, '0')}-${dob!.month.toString().padLeft(2, '0')}-${dob!.day.toString().padLeft(2, '0')}",
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
