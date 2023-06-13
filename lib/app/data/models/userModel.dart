import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  int id;
  String name;
  String email;
  int? mobile;
  DateTime? dob;
  int gender;
  String profileImage;
  String? identify;
  String profilePhotoUrl;

  User({
    required this.id,
    required this.name,
    required this.email,
    this.mobile,
    this.dob,
    required this.gender,
    required this.profileImage,
    this.identify,
    required this.profilePhotoUrl,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        mobile: json["mobile"],
        dob: json["dob"] != null ? DateTime.parse(json["dob"]) : null,

        //dob: DateTime.parse(json["dob"]),
        gender: json["gender"] ?? 0,
        profileImage: json["profile_image"],
        identify: json["identify"],
        profilePhotoUrl: json["profile_photo_url"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "mobile": mobile,
        // "dob": dob != null
        //     ? "${dob!.year.toString().padLeft(4, '0')}-${dob!.month.toString().padLeft(2, '0')}-${dob!.day.toString().padLeft(2, '0')}"
        //     : null,

        "dob":
            "${dob!.year.toString().padLeft(4, '0')}-${dob!.month.toString().padLeft(2, '0')}-${dob!.day.toString().padLeft(2, '0')}",
        "gender": gender,
        "profile_image": profileImage,
        "identify": identify,
        "profile_photo_url": profilePhotoUrl,
      };
}
