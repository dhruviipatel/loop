import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:loop/app/data/models/userPostModel.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../models/followersModel.dart';
import '../models/followingsModel.dart';

class UserProfileProvider with ChangeNotifier {
  //click on more item
  bool _buttonclicked = false;

  bool get buttonclicked => _buttonclicked;

  onbtnclick() {
    _buttonclicked = !_buttonclicked;
    notifyListeners();
  }

  //click on followers
  bool _followerclick = false;
  bool get followerclick => _followerclick;

  onfollowerclick() {
    _followerclick = !_followerclick;
    notifyListeners();
  }

  //get post
  List _userpostlist = [];
  get userpostlist => _userpostlist;
  getUserAllPost(userid, postlist) {
    _userpostlist.clear();
    for (int i = 0; i < postlist.length; i++) {
      if (postlist[i].customerId == userid) {
        if (_userpostlist.contains(postlist[i].customerId)) {
          print("already available");
        } else {
          _userpostlist.add(postlist[i]);
        }
      }
    }
  }

  getmyuserpost(userid) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    var mytoken = sp.getString("token");
    final userUrl = "https://looptest.inventdi.com/api/Post/getUserAllPost";
    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $mytoken',
    };

    final body = jsonEncode({
      'user_id': userid,
      "category_id": 1,
    });
    var response =
        await http.post(Uri.parse(userUrl), headers: headers, body: body);
    if (response.statusCode == 200) {
      final userJson = response.body;

      var decodeduserJson = await json.decode(userJson);
      var data = decodeduserJson["data"];

      if (data is List) {
        _userpostlist = data
            .map<Post>(
              (e) => Post.fromJson(e),
            )
            .toList();
        notifyListeners();
      } else {
        print("Invalid data format: $data");
      }
    } else {
      print('failed to load posts');
    }
    notifyListeners();
  }

  //get user's all image post
  List _userimagelist = [];
  get userimagelist => _userimagelist;
  getUserImageList(userpostlist) {
    _userimagelist.clear();
    for (int i = 0; i < userpostlist.length; i++) {
      if (userpostlist[i].postImage.isNotEmpty) {
        _userimagelist.add(userpostlist[i]);
      } else {
        print("empty img ");
      }
    }
  }

  //get user's all video post
  List _uservideolist = [];
  get uservideolist => _uservideolist;
  getUserVideoList(userpostlist) {
    _uservideolist.clear();
    for (int i = 0; i < userpostlist.length; i++) {
      if (userpostlist[i].postVideo.isNotEmpty) {
        _uservideolist.add(userpostlist[i]);
        //print("user videolist:${_uservideolist}");
      } else {
        print("empty vdo");
      }
    }
  }

  //get followers data
  List followerList = [];

  myfollowers(userid) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    var mytoken = sp.getString("token");
    final followerUrl =
        "https://looptest.inventdi.com/api/User/getFollowersByUser";
    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $mytoken',
    };

    final body = jsonEncode({
      'customer_id': userid,
    });
    var response =
        await http.post(Uri.parse(followerUrl), headers: headers, body: body);

    if (response.statusCode == 200) {
      final followerJson = response.body;

      var decodedfollowerJson = await json.decode(followerJson);
      var data = decodedfollowerJson["data"];

      followerList = List.from(data ?? [])
          .map<Followers>(
            (e) => Followers.fromJson(e),
          )
          .toList();
      notifyListeners();
    } else {
      print('failed to load followers');
    }
  }

  //get following data
  List followingList = [];

  myfollowing(userid) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    var mytoken = sp.getString("token");
    final followingUrl =
        "https://looptest.inventdi.com/api/User/getFollowingUser";
    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $mytoken',
    };

    final body = jsonEncode({
      'customer_id': userid,
    });
    var response =
        await http.post(Uri.parse(followingUrl), headers: headers, body: body);

    if (response.statusCode == 200) {
      final followingJson = response.body;
      if (followingJson.isNotEmpty) {
        var decodedfollowingJson = json.decode(followingJson);
        var data = decodedfollowingJson["data"];

        followingList = List.from(data ?? [])
            .map<Following>(
              (e) => Following.fromJson(e),
            )
            .toList();
        notifyListeners();
      } else {
        print('Empty response body');
      }
    } else {
      print('Failed to load followings');
    }
  }

  //started following user

  Future<void> followUser(int followinguserId, int userId, context) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    var mytoken = sp.getString("token");
    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $mytoken',
    };

    final body = jsonEncode({
      'user_id': userId,
      'following_user_id': followinguserId,
    });

    final followurl =
        'https://looptest.inventdi.com/api/User/sendFollowingRequest';

    try {
      var response =
          await http.post(Uri.parse(followurl), headers: headers, body: body);
      if (response.statusCode == 200) {
        print("successfully follow user.");
        //incrementfollower(searchuser);
        notifyListeners();
      } else {
        print("failed to follow user.");
      }
    } catch (e) {
      print("error ${e}");
    }
    notifyListeners();
  }

  //remove follower
  Future<void> removeFollower(int followerId, int userId, context) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    var mytoken = sp.getString("token");
    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $mytoken',
    };

    final body = jsonEncode({
      'user_id': userId,
      'followed_user_id': followerId,
    });

    final deletefollowerurl =
        'https://looptest.inventdi.com/api/User/sendUnfollowerRequest';

    try {
      var response = await http.post(Uri.parse(deletefollowerurl),
          headers: headers, body: body);
      if (response.statusCode == 200) {
        print("successfully removed follower.");
        notifyListeners();
        Navigator.pop(context);
      } else {
        print("failed to removed follower.");
      }
    } catch (e) {
      print("error ${e}");
    }
    notifyListeners();
  }

  //unfollow user
  Future<void> UnFollowUser(int followinguserId, int userId, context) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    var mytoken = sp.getString("token");
    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $mytoken',
    };

    final body = jsonEncode({
      'user_id': userId,
      'following_user_id': followinguserId,
    });

    final unfollowurl =
        'https://looptest.inventdi.com/api/User/sendUnfollowingRequest';

    try {
      var response =
          await http.post(Uri.parse(unfollowurl), headers: headers, body: body);
      if (response.statusCode == 200) {
        print("successfully unfollow user.");
        getupdatedfollowing(userId, followinguserId);

        notifyListeners();
      } else {
        print("failed to unfollow user.");
      }
    } catch (e) {
      print("error ${e}");
    }
    notifyListeners();
  }

  void getupdatedfollowing(int userId, int followinguserId) {
    int followingIndex = followingList.indexWhere(
      (element) => element.followingCustomerId == followinguserId,
    );
    followingList.removeAt(followingIndex);

    notifyListeners();
  }

  void getupdatedFollower(int userId, int followeruserId) {
    int followerIndex = followerList.indexWhere(
      (element) => element.followedCustomerId == followeruserId,
    );
    followingList.removeAt(followerIndex);

    notifyListeners();
  }

  bool isprofilefollowing = false;

  void getprofilefollowing(followerlist, loginuserid) {
    for (var i = 0; i < followerlist.length; i++) {
      if (followerlist[i].customerId == loginuserid) {
        isprofilefollowing = true;
      }
    }
  }

  void profilefollowingcheck(followerlist, loginuserid, searchuser) {
    for (var i = 0; i < followerlist.length; i++) {
      if (followerlist[i].customerId == loginuserid) {
        isprofilefollowing = true;
        incrementfollower(searchuser);
        notifyListeners();
      } else {
        decrementfollower(searchuser);
        notifyListeners();
      }
    }
  }

  incrementfollower(searchuser) {
    searchuser.follower++;
    notifyListeners();
  }

  decrementfollower(searchuser) {
    searchuser.follower--;
    notifyListeners();
  }
}
