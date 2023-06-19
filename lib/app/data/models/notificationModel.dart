// To parse this JSON data, do
//
//     final notificationModel = notificationModelFromJson(jsonString);

import 'dart:convert';

NotificationModel notificationModelFromJson(String str) =>
    NotificationModel.fromJson(json.decode(str));

String notificationModelToJson(NotificationModel data) =>
    json.encode(data.toJson());

class NotificationModel {
  bool success;
  String message;
  List<Notify> data;

  NotificationModel({
    required this.success,
    required this.message,
    required this.data,
  });

  factory NotificationModel.fromJson(Map<String, dynamic> json) =>
      NotificationModel(
        success: json["success"],
        message: json["message"],
        data: List<Notify>.from(json["data"].map((x) => Notify.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Notify {
  int id;
  int type;
  int customerId;
  int? postId;
  int? postCustomerId;
  int notificationUser;
  String msg;
  String createdAt;
  String updatedAt;
  HumanReadableCreatedDate? humanReadableCreatedDate;
  User? user;

  Notify({
    required this.id,
    required this.type,
    required this.customerId,
    this.postId,
    this.postCustomerId,
    required this.notificationUser,
    required this.msg,
    required this.createdAt,
    required this.updatedAt,
    required this.humanReadableCreatedDate,
    this.user,
  });

  factory Notify.fromJson(Map<String, dynamic> json) {
    final createdDate = json["human_readable_created_date"];
    final humanReadableCreatedDate = createdDate != null
        ? humanReadableCreatedDateValues.map[createdDate]
        : null;

    return Notify(
      id: json["id"] ?? 0,
      type: json["type"] ?? 0,
      customerId: json["customer_id"] ?? 0,
      postId: json["post_id"] ?? 0,
      postCustomerId: json["post_customer_id"] ?? 0,
      notificationUser: json["notification_user"] ?? 0,
      msg: json["msg"] ?? "",
      createdAt: json["created_at"] ?? "",
      updatedAt: json["updated_at"] ?? "",
      humanReadableCreatedDate: humanReadableCreatedDate,
      user: json["user"] == null ? null : User.fromJson(json["user"]),
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "type": type,
        "customer_id": customerId,
        "post_id": postId,
        "post_customer_id": postCustomerId,
        "notification_user": notificationUser,
        "msg": msg,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "human_readable_created_date":
            humanReadableCreatedDateValues.reverse[humanReadableCreatedDate],
        "user": user?.toJson(),
      };
}

enum HumanReadableCreatedDate { THE_7_MONTHS_AGO, THE_9_MONTHS_AGO }

final humanReadableCreatedDateValues = EnumValues({
  "7 months ago": HumanReadableCreatedDate.THE_7_MONTHS_AGO,
  "9 months ago": HumanReadableCreatedDate.THE_9_MONTHS_AGO
});

class User {
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
  DateTime dob;
  int gender;
  int isActive;
  String? accessToken;
  int? deviceType;
  String? deviceToken;
  String profileImage;
  String createdAt;
  String updatedAt;
  dynamic deletedAt;
  int isBlocked;
  dynamic identify;
  String profilePhotoUrl;

  User({
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
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
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
      };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
