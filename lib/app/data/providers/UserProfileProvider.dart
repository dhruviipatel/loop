import 'dart:convert';
import 'package:flutter/material.dart';
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

  //get post
  List _userpostlist = [];
  get userpostlist => _userpostlist;
  getUserAllPost(postlist, userid) {
    _userpostlist.clear();
    for (int i = 0; i < postlist.length; i++) {
      if (postlist[i].customerId == userid) {
        if (_userpostlist.contains(postlist[i].customerId)) {
          print("already available");
        } else {
          _userpostlist.add(postlist[i]);
          // print("user post list:${_userpostlist}");
        }
      }
    }
  }

  //get user's all image post
  List _userimagelist = [];
  get userimagelist => _userimagelist;
  getUserImageList(userpostlist) {
    _userimagelist.clear();
    for (int i = 0; i < userpostlist.length; i++) {
      if (userpostlist[i].postImage.isNotEmpty) {
        _userimagelist.add(userpostlist[i]);
        //print("user imagelist:${_userimagelist}");
      } else {
        print("empty ");
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
        print("empty ");
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

      followerList = List.from(data)
          .map<Followers>(
            (e) => Followers.fromJson(e),
          )
          .toList();
      print("list:${followerList}");
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
      } else {
        print('Empty response body');
      }
    } else {
      print('Failed to load followings');
    }
  }
}
