// To parse this JSON data, do
//
//     final userPost = userPostFromJson(jsonString);

import 'dart:convert';

UserPost userPostFromJson(String str) => UserPost.fromJson(json.decode(str));

String userPostToJson(UserPost data) => json.encode(data.toJson());

class UserPost {
  bool success;
  String message;
  Data data;

  UserPost({
    required this.success,
    required this.message,
    required this.data,
  });

  factory UserPost.fromJson(Map<String, dynamic> json) => UserPost(
        success: json["success"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": data.toJson(),
      };
}

class Data {
  List<Post> post;
  bool pageEnd;

  Data({
    required this.post,
    required this.pageEnd,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        post: List<Post>.from(json["post"].map((x) => Post.fromJson(x))),
        pageEnd: json["page_end"],
      );

  Map<String, dynamic> toJson() => {
        "post": List<dynamic>.from(post.map((x) => x.toJson())),
        "page_end": pageEnd,
      };
}

class Post {
  int postId;
  int customerId;
  int categoryId;
  String postType;
  String? postCaption;
  dynamic description;
  String? location;
  String? latitude;
  String? longitude;
  String shareUrl;
  String createdAt;
  String updatedAt;
  int postLikesCount;
  int postCommentsCount;
  String humanReadableCreatedDate;
  List<PostImage> postImage;
  List<PostVideo> postVideo;
  List<PostLike> postLikes;
  List<PostComment> postComments;
  Users user;

  Post({
    required this.postId,
    required this.customerId,
    required this.categoryId,
    required this.postType,
    this.postCaption,
    this.description,
    this.location,
    this.latitude,
    this.longitude,
    required this.shareUrl,
    required this.createdAt,
    required this.updatedAt,
    required this.postLikesCount,
    required this.postCommentsCount,
    required this.humanReadableCreatedDate,
    required this.postImage,
    required this.postVideo,
    required this.postLikes,
    required this.postComments,
    required this.user,
  });

  factory Post.fromJson(Map<String, dynamic> json) => Post(
        postId: json["post_id"],
        customerId: json["customer_id"],
        categoryId: json["category_id"],
        postType: json["post_type"],
        postCaption: json["post_caption"],
        description: json["description"],
        location: json["location"],
        latitude: json["latitude"],
        longitude: json["longitude"],
        shareUrl: json["share_url"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        postLikesCount: json["postLikesCount"],
        postCommentsCount: json["postCommentsCount"],
        humanReadableCreatedDate: json["human_readable_created_date"],
        postImage: List<PostImage>.from(
            json["post_image"].map((x) => PostImage.fromJson(x))),
        postVideo: List<PostVideo>.from(
            json["post_video"].map((x) => PostVideo.fromJson(x))),
        postLikes: List<PostLike>.from(
            json["post_likes"].map((x) => PostLike.fromJson(x))),
        postComments: List<PostComment>.from(
            json["post_comments"].map((x) => PostComment.fromJson(x))),
        user: Users.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "post_id": postId,
        "customer_id": customerId,
        "category_id": categoryId,
        "post_type": postType,
        "post_caption": postCaption,
        "description": description,
        "location": locationValues.reverse[location],
        "latitude": latitude,
        "longitude": longitude,
        "share_url": shareUrl,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "postLikesCount": postLikesCount,
        "postCommentsCount": postCommentsCount,
        "human_readable_created_date": humanReadableCreatedDate,
        "post_image": List<dynamic>.from(postImage.map((x) => x.toJson())),
        "post_video": List<dynamic>.from(postVideo.map((x) => x.toJson())),
        "post_likes": List<dynamic>.from(postLikes.map((x) => x.toJson())),
        "post_comments":
            List<dynamic>.from(postComments.map((x) => x.toJson())),
        "user": user.toJson(),
      };
}

enum Location { EMPTY, NAVSARI_INDIA }

final locationValues =
    EnumValues({"": Location.EMPTY, "Navsari, India": Location.NAVSARI_INDIA});

class PostComment {
  int postCommentId;
  int postId;
  int customerId;
  String postComment;
  String createdAt;
  String updatedAt;
  int postCommentLikesCount;
  List<PostCommentsLike> postCommentsLikes;
  Users? user;

  PostComment({
    required this.postCommentId,
    required this.postId,
    required this.customerId,
    required this.postComment,
    required this.createdAt,
    required this.updatedAt,
    required this.postCommentLikesCount,
    required this.postCommentsLikes,
    this.user,
  });

  factory PostComment.fromJson(Map<String, dynamic> json) => PostComment(
        postCommentId: json["post_comment_id"],
        postId: json["post_id"],
        customerId: json["customer_id"],
        postComment: json["post_comment"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        postCommentLikesCount: json["postCommentLikesCount"],
        postCommentsLikes: List<PostCommentsLike>.from(
            json["post_comments_likes"]
                .map((x) => PostCommentsLike.fromJson(x))),
        user: json["user"] == null ? null : Users.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "post_comment_id": postCommentId,
        "post_id": postId,
        "customer_id": customerId,
        "post_comment": postComment,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "postCommentLikesCount": postCommentLikesCount,
        "post_comments_likes":
            List<dynamic>.from(postCommentsLikes.map((x) => x.toJson())),
        "user": user?.toJson(),
      };
}

class PostCommentsLike {
  int postCommentLikeId;
  int postCommentId;
  int postId;
  int customerId;
  int isLike;
  String createdAt;
  String updatedAt;

  PostCommentsLike({
    required this.postCommentLikeId,
    required this.postCommentId,
    required this.postId,
    required this.customerId,
    required this.isLike,
    required this.createdAt,
    required this.updatedAt,
  });

  factory PostCommentsLike.fromJson(Map<String, dynamic> json) =>
      PostCommentsLike(
        postCommentLikeId: json["post_comment_like_id"],
        postCommentId: json["post_comment_id"],
        postId: json["post_id"],
        customerId: json["customer_id"],
        isLike: json["is_like"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
      );

  Map<String, dynamic> toJson() => {
        "post_comment_like_id": postCommentLikeId,
        "post_comment_id": postCommentId,
        "post_id": postId,
        "customer_id": customerId,
        "is_like": isLike,
        "created_at": createdAt,
        "updated_at": updatedAt,
      };
}

class Users {
  int id;
  String name;
  String email;
  dynamic emailVerifiedAt;
  int isAdmin;
  String? countryCode;
  int? mobile;
  String? facebookId;
  String? googleId;
  String? socialType;
  DateTime? dob;
  int? gender;
  int isActive;
  String? accessToken;
  int? deviceType;
  String? deviceToken;
  String profileImage;

  int isBlocked;
  dynamic identify;
  String profilePhotoUrl;
  int? following;
  int? follower;

  Users({
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
    this.gender,
    required this.isActive,
    this.accessToken,
    this.deviceType,
    this.deviceToken,
    required this.profileImage,
    required this.isBlocked,
    this.identify,
    required this.profilePhotoUrl,
    this.following,
    this.follower,
  });

  factory Users.fromJson(Map<String, dynamic> json) => Users(
        id: json["id"] ?? 0,
        name: json["name"] ?? "",
        email: json["email"] ?? "",
        emailVerifiedAt: json["email_verified_at"],
        isAdmin: json["is_admin"] ?? 0,
        countryCode: json["country_code"],
        mobile: json["mobile"] ?? 0,
        facebookId: json["facebook_id"],
        googleId: json["google_id"],
        socialType: json["social_type"],
        dob: json["dob"] == null ? null : DateTime.parse(json["dob"]),
        gender: json["gender"],
        isActive: json["is_active"] ?? 0,
        accessToken: json["access_token"],
        deviceType: json["device_type"],
        deviceToken: json["device_token"],
        profileImage: json["profile_image"] ?? "",
        isBlocked: json["is_blocked"] ?? 0,
        identify: json["identify"],
        profilePhotoUrl: json["profile_photo_url"] ?? "",
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
        "dob": dob != null
            ? "${dob!.year.toString().padLeft(4, '0')}-${dob!.month.toString().padLeft(2, '0')}-${dob!.day.toString().padLeft(2, '0')}"
            : null,
        "gender": gender,
        "is_active": isActive,
        "access_token": accessToken,
        "device_type": deviceType,
        "device_token": deviceToken,
        "profile_image": profileImage,
        "is_blocked": isBlocked,
        "identify": identify,
        "profile_photo_url": profilePhotoUrl,
        "following": following,
        "follower": follower,
      };
}

class PostImage {
  int postImageId;
  int postId;
  int customerId;
  String postImage;
  String createdAt;
  String updatedAt;

  PostImage({
    required this.postImageId,
    required this.postId,
    required this.customerId,
    required this.postImage,
    required this.createdAt,
    required this.updatedAt,
  });

  factory PostImage.fromJson(Map<String, dynamic> json) => PostImage(
        postImageId: json["post_image_id"],
        postId: json["post_id"],
        customerId: json["customer_id"],
        postImage: json["post_image"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
      );

  Map<String, dynamic> toJson() => {
        "post_image_id": postImageId,
        "post_id": postId,
        "customer_id": customerId,
        "post_image": postImage,
        "created_at": createdAt,
        "updated_at": updatedAt,
      };
}

class PostLike {
  int postLikesId;
  int customerId;
  int postId;
  int isLike;
  String createdAt;
  String updatedAt;

  PostLike({
    required this.postLikesId,
    required this.customerId,
    required this.postId,
    required this.isLike,
    required this.createdAt,
    required this.updatedAt,
  });

  factory PostLike.fromJson(Map<String, dynamic> json) => PostLike(
        postLikesId: json["post_likes_id"],
        customerId: json["customer_id"],
        postId: json["post_id"],
        isLike: json["is_like"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
      );

  Map<String, dynamic> toJson() => {
        "post_likes_id": postLikesId,
        "customer_id": customerId,
        "post_id": postId,
        "is_like": isLike,
        "created_at": createdAt,
        "updated_at": updatedAt,
      };
}

class PostVideo {
  int postVideoId;
  int postId;
  int customerId;
  String postVideo;
  String createdAt;
  String updatedAt;

  PostVideo({
    required this.postVideoId,
    required this.postId,
    required this.customerId,
    required this.postVideo,
    required this.createdAt,
    required this.updatedAt,
  });

  factory PostVideo.fromJson(Map<String, dynamic> json) => PostVideo(
        postVideoId: json["post_video_id"],
        postId: json["post_id"],
        customerId: json["customer_id"],
        postVideo: json["post_video"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
      );

  Map<String, dynamic> toJson() => {
        "post_video_id": postVideoId,
        "post_id": postId,
        "customer_id": customerId,
        "post_video": postVideo,
        "created_at": createdAt,
        "updated_at": updatedAt,
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
