import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:loop/app/data/models/searchUserModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SearchProvider with ChangeNotifier {
  var data = [];

  List allUsers = [];

  List foundUsers = [];

  Future getAllUsers() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    var mytoken = sp.getString("token")!;

    final searchUrl = "https://looptest.inventdi.com/api/User/getAllUser";
    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $mytoken',
    };

    var url = Uri.parse(searchUrl);
    var response = await http.post(url, headers: headers);

    if (response.statusCode == 200) {
      var alldata = jsonDecode(response.body);

      data = alldata["data"];
      allUsers = data.map((e) => FoundUser.fromJson(e)).toList();

      foundUsers = allUsers;
      notifyListeners();

      return foundUsers;
    } else {
      print("users api error");
    }

    return foundUsers;
  }

  void checkfoundprofile() {}

  void runFilter(String enteredText) {
    List result = [];
    if (enteredText.isEmpty) {
      result = allUsers;
      notifyListeners();
    } else {
      result = allUsers
          .where((element) => element.name
              .toString()
              .toLowerCase()
              .contains(enteredText.toLowerCase()))
          .toList();
      notifyListeners();
    }

    foundUsers = result;
    notifyListeners();
  }
}
