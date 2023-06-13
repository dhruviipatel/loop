import 'dart:convert';

FollowersModel followersModelFromJson(String str) =>
    FollowersModel.fromJson(json.decode(str));

String followersModelToJson(FollowersModel data) => json.encode(data.toJson());

class FollowersModel {
  bool success;
  List<Followers> data;
  String message;

  FollowersModel({
    required this.success,
    required this.data,
    required this.message,
  });

  factory FollowersModel.fromJson(Map<String, dynamic> json) => FollowersModel(
        success: json["success"],
        data: List<Followers>.from(
            json["data"].map((x) => Followers.fromJson(x))),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "message": message,
      };
}

class Followers {
  int followingId;
  int customerId;
  int followingCustomerId;
  int isAccept;
  String createdAt;
  String updatedAt;
  FollowedCustomer followedCustomer;

  Followers({
    required this.followingId,
    required this.customerId,
    required this.followingCustomerId,
    required this.isAccept,
    required this.createdAt,
    required this.updatedAt,
    required this.followedCustomer,
  });

  factory Followers.fromJson(Map<String, dynamic> json) => Followers(
        followingId: json["following_id"],
        customerId: json["customer_id"],
        followingCustomerId: json["following_customer_id"],
        isAccept: json["is_accept"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        followedCustomer: FollowedCustomer.fromJson(json["followed_customer"]),
      );

  Map<String, dynamic> toJson() => {
        "following_id": followingId,
        "customer_id": customerId,
        "following_customer_id": followingCustomerId,
        "is_accept": isAccept,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "followed_customer": followedCustomer.toJson(),
      };
}

class FollowedCustomer {
  int id;
  String name;
  String email;
  dynamic emailVerifiedAt;
  int isAdmin;
  String countryCode;
  dynamic mobile;
  String facebookId;
  dynamic googleId;
  String socialType;
  DateTime? dob;
  int gender;
  int isActive;
  String accessToken;
  dynamic deviceType;
  dynamic deviceToken;
  String profileImage;
  String createdAt;
  String updatedAt;
  dynamic deletedAt;
  int isBlocked;
  String identify;
  String profilePhotoUrl;
  int following;
  int follower;

  FollowedCustomer({
    required this.id,
    required this.name,
    required this.email,
    this.emailVerifiedAt,
    required this.isAdmin,
    required this.countryCode,
    this.mobile,
    required this.facebookId,
    this.googleId,
    required this.socialType,
    this.dob,
    required this.gender,
    required this.isActive,
    required this.accessToken,
    this.deviceType,
    this.deviceToken,
    required this.profileImage,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
    required this.isBlocked,
    required this.identify,
    required this.profilePhotoUrl,
    required this.following,
    required this.follower,
  });

  factory FollowedCustomer.fromJson(Map<String, dynamic> json) =>
      FollowedCustomer(
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
