import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../models/searchingModel.dart';
import '../models/userModel.dart';

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
      allUsers = data.map((e) => User.fromJson(e)).toList();

      foundUsers = allUsers;
      notifyListeners();

      return foundUsers;
    } else {
      print("users api error");
    }

    return foundUsers;
  }

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

  //get search data
  List searchList = [];

  searchusers(keyword) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    var mytoken = sp.getString("token");
    final sUrl = "https://looptest.inventdi.com/api/User/searchUser";
    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $mytoken',
    };

    final body = jsonEncode({
      'keyword': keyword,
    });
    var response =
        await http.post(Uri.parse(sUrl), headers: headers, body: body);

    if (response.statusCode == 200) {
      final searchJson = response.body;

      var decodedJson = await json.decode(searchJson);
      var data = decodedJson["data"];

      // print("data:${data}");

      if (data is List<dynamic>) {
        searchList = data
            .map<Search>(
              (e) => Search.fromJson(e),
            )
            .toList();
      } else if (data is Map<String, dynamic>) {
        searchList = [Search.fromJson(data)];

        print(searchList);
      }
      notifyListeners();
    } else {
      print('failed to load users');
    }
  }
}
