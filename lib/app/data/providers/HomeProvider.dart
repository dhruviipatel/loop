import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:loop/app/data/models/reportModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:http/http.dart' as http;

import '../models/categoryModel.dart';
import '../models/userPostModel.dart';

class HomeProvider with ChangeNotifier {
  //click on more item
  bool _isclicked = false;
  bool get isclicked => _isclicked;

  click() {
    _isclicked = !_isclicked;
    notifyListeners();
  }

  //get category list from API

  List _catalist = [];
  get catalist => _catalist;

  mycata() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    var mytoken = sp.getString("token")!;
    final catagoryUrl = "https://looptest.inventdi.com/api/Post/getCategories";
    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $mytoken',
    };

    var response = await http.get(Uri.parse(catagoryUrl), headers: headers);
    if (response.statusCode == 200) {
      final catagoryJson = response.body;

      var decodedCatagoryJson = await json.decode(catagoryJson);
      var data = decodedCatagoryJson["data"];

      _catalist = List.from(data)
          .map<Category>(
            (e) => Category.fromJson(e),
          )
          .toList();
      //print("catalist:${_catalist}");
      return _catalist;
    } else {
      print('failed to load categories');
    }
    notifyListeners();
  }

  List _postlist = [];
  get postlist => _postlist;
  //get all users to match its id with customer id and retrive data
  List myUsers = [];

  List postUserlist = [];
  List allUsers = [];
  String postusername = "";
  var userid = "";
  var userProImage = "https://looptest.inventdi.com/profile_images/default.png";
  mypost(context) async {
    //get users data
    SharedPreferences sp = await SharedPreferences.getInstance();
    var user = sp.getString('userinfo');

    if (user != null) {
      var decoded = jsonDecode(user);
      userid = decoded['id'].toString();
      var prf = decoded['profile_image'];
      if (prf != null) {
        userProImage = decoded['profile_image'];
      }
    } else {
      print("user not available");
    }

    var mytoken = sp.getString("token");

    final postUrl = "https://looptest.inventdi.com/api/Post/getUserAllPost";
    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $mytoken',
    };

    final allUserUrl = "https://looptest.inventdi.com/api/User/getAllUser";

    var url = Uri.parse(allUserUrl);
    var response1 = await http.post(url, headers: headers);

    if (response1.statusCode == 200) {
      var alldata = jsonDecode(response1.body);

      var mydata = alldata["data"];

      allUsers = mydata.map((e) => Users.fromJson(e)).toList();
    } else {
      print("users api error");
    }

    final body = jsonEncode({
      'user_id': userid,
      'category_id': 1,
    });
    var response =
        await http.post(Uri.parse(postUrl), headers: headers, body: body);

    if (response.statusCode == 200) {
      final postJson = response.body;
      // print("postjson:${postJson}");

      var decodedpostJson = await json.decode(postJson);
      var maindata = decodedpostJson["data"];
      var data = maindata['post'];
      //print("data:${data}");

      _postlist = List.from(data).map<Post>((e) => Post.fromJson(e)).toList();
      notifyListeners();
      // print(postlist);

      allUsers.forEach((u) {
        postlist.forEach((p) {
          if (p.customerId == u.id) {
            postUserlist.add(u);
          }
        });
      });
      myUsers =
          postUserlist.map<Users>((e) => Users.fromJson(e.toJson())).toList();
    } else {
      print('failed to load posts');
    }
    notifyListeners();
  }

  removelikecolor(postId, customerId) {
    int index = _postlist.indexWhere((element) => element.postId == postId);
    int index1 = _postlist[index]
        .postLikes
        .indexWhere((element) => element.customerId.toString() == customerId);
    _postlist[index].postLikes.removeAt(index1);
    notifyListeners();
  }

  addlikecolor(postId, postlike) {
    int index = _postlist.indexWhere((element) => element.postId == postId);

    _postlist[index].postLikes.add(postlike);
    notifyListeners();
  }

  checklikecolor(postId, customerId) {
    int index = _postlist.indexWhere((element) => element.postId == postId);
    int index1 = _postlist[index]
        .postLikes
        .indexWhere((element) => element.customerId.toString() == customerId);
    return index1 == -1 ? true : false;
    // _postlist[index].postLikes.removeAt(index1);
    //notifyListeners();
  }

  //post user data
  var postuser = "";
  var postuserprofile = "";
  postuserdata(postuserId) {
    for (int i = 0; i < allUsers.length; i++) {
      if (allUsers[i].id == postuserId) {
        postuser = allUsers[i].name;
        postuserprofile = allUsers[i].profileImage;
      }
    }
  }

  //post first comment data
  var cmuser = "";
  cmuserdata(cmuserId) {
    for (int i = 0; i < allUsers.length; i++) {
      if (allUsers[i].id == cmuserId) {
        cmuser = allUsers[i].name;
      }
    }
  }

  int _currentIndex = 0;
  int get currentIndex => _currentIndex;

  //post image view
  ImageViews(mypostImage) {
    _currentIndex = mypostImage.length;
    notifyListeners();
  }

  bool _isPostLiked = false;
  get isPostLiked => _isPostLiked;

  PostLike? thispostlike;
  Future doPostLike(postindex, postid, userid) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    var mytoken = sp.getString("token")!;

    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $mytoken',
    };

    var postlikeApi = "https://looptest.inventdi.com/api/Post/postLike";
    final body = jsonEncode({
      'post_id': postid.toString(),
      'user_id': userid,
    });
    var response =
        await http.post(Uri.parse(postlikeApi), body: body, headers: headers);
    print("resonse ${response.body}");
    if (response.statusCode == 200) {
      var decodedpostJson = await json.decode(response.body);
      var data = decodedpostJson["data"];
      var cust_id = data["customer_id"];
      var post_id = data['post_id'];
      var is_like = data["is_like"];
      var post_likes_id = data['post_likes_id'];
      var create = data["created_at"];
      var update = data["updated_at"];

      print("data $data");
      thispostlike = PostLike(
          postLikesId: post_likes_id,
          customerId: int.parse(cust_id),
          postId: int.parse(post_id),
          isLike: int.parse(is_like),
          createdAt: create,
          updatedAt: update);

      print("mylikedpost $thispostlike");
      _isPostLiked = true;

      print("post like successfull");

      incrementLike(postid);
      notifyListeners();
      return thispostlike;
    } else {
      print("post like failed");
    }
    notifyListeners();
  }

  List checklikeuser = [];

  //checked user liked the post or not if liked post then store that postlike in checklikeuser list otherwise it clear list
  userlikecheck(mypostlike) {
    for (var i = 0; i < mypostlike.length; i++) {
      if (mypostlike[i].customerId.toString() == userid) {
        checklikeuser.add(mypostlike[i]);
      } else {
        checklikeuser = [];
      }
    }
  }

  // userlikeupdate(mypostlike) {
  //   for (var i = 0; i < mypostlike.length; i++) {
  //     if (mypostlike[i].customerId.toString() == userid) {
  //       checklikeuser.add(mypostlike[i]);
  //       notifyListeners();
  //     } else {
  //       checklikeuser = [];
  //       notifyListeners();
  //     }
  //   }
  // }

  incrementLike(postid) {
    int storelikedata =
        _postlist.indexWhere((element) => element.postId == postid);
    _postlist[storelikedata].postLikesCount++;
    notifyListeners();
  }

  decrementLike(postid) {
    int storelikedata =
        _postlist.indexWhere((element) => element.postId == postid);
    _postlist[storelikedata].postLikesCount--;

    notifyListeners();
  }

  Future doPostDislike(postlikeid, postid, userid) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    var mytoken = sp.getString("token")!;

    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $mytoken',
    };

    var postdislikeApi = "https://looptest.inventdi.com/api/Post/postDislike";
    final body = jsonEncode({
      'post_id': postid.toString(),
      'user_id': userid,
      'post_likes_id': postlikeid,
    });

    // print("JSON data: ${body}");

    var response = await http.post(Uri.parse(postdislikeApi),
        body: body, headers: headers);

    if (response.statusCode == 200) {
      _isPostLiked = true;
      print("post like remove successfull");
      decrementLike(postid);
      //updatelikebyuser(mypostlike);
      notifyListeners();
    } else {
      print("post like remove failed");
    }
    notifyListeners();
  }

  catawisepost(myid) {
    List postlist1 = [];

    _postlist.forEach((p) {
      if (p.categoryId.toString() == myid.toString()) {
        postlist1.add(p);
        // print("101010 ${postlist1}");
        notifyListeners();
      }
    });
    _postlist = postlist1;
    notifyListeners();
  }

  List _reportlist = [];
  List get reportlist => _reportlist;
  getreportlist() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    var mytoken = sp.getString("token")!;

    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $mytoken',
    };

    var reportApi = "https://looptest.inventdi.com/api/Post/getReportList";

    var response = await http.get(Uri.parse(reportApi), headers: headers);

    if (response.statusCode == 200) {
      var alldata = jsonDecode(response.body);

      var mydata = alldata["data"];

      _reportlist = mydata.map((e) => Report.fromJson(e)).toList();

      print(_reportlist);
      print("get reportlist successfully.");

      notifyListeners();
    } else {
      print("failed to get reportlist");
    }
    notifyListeners();
  }
}
