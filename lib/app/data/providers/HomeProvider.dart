import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:http/http.dart' as http;

import '../models/categoryModel.dart';
import '../models/userModel.dart';
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

  List catalist = [];

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

      catalist = List.from(data)
          .map<Category>(
            (e) => Category.fromJson(e),
          )
          .toList();
    } else {
      print('failed to load categories');
    }
  }

  //get all users to match its id with costumer id and retrive data
  List myUsers = [];
  List postlist = [];
  List postUserlist = [];
  List allUsers = [];
  String postusername = "";
  mypost(context) async {
    //get users data

    SharedPreferences sp = await SharedPreferences.getInstance();
    var user = sp.getString('userinfo');
    var userid = "";

    //print("user 3232:${user}");

    if (user != null) {
      var decoded = jsonDecode(user);
      userid = decoded['id'].toString();
      //print("user id:${userid}");
    } else {
      print("user not available");
    }

    var mytoken = sp.getString("token")!;

    final postUrl = "https://looptest.inventdi.com/api/Post/getUserPost";
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

      // print("data = ${mydata}");
      allUsers = mydata.map((e) => Users.fromJson(e)).toList();
    } else {
      print("users api error");
    }

    final body = jsonEncode({
      'user_id': userid,
      'page_index': 0,
      'category_id': 1,
    });
    var response =
        await http.post(Uri.parse(postUrl), headers: headers, body: body);

    if (response.statusCode == 200) {
      final postJson = response.body;

      var decodedpostJson = await json.decode(postJson);
      var maindata = decodedpostJson["data"];
      var data = maindata['post'];
      // print(data);
      postlist = List.from(data).map<Post>((e) => Post.fromJson(e)).toList();
      // print(postlist);

      allUsers.forEach((u) {
        List myuser = [];
        postlist.forEach((p) {
          if (p.customerId == u.id) {
            postUserlist.add(u);
          }
          // else {
          //   print("123");
          // }
        });
      });
      myUsers =
          postUserlist.map<User>((e) => User.fromJson(e.toJson())).toList();
    } else {
      print('failed to load posts');
    }
  }
}
