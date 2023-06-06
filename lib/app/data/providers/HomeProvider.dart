import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:http/http.dart' as http;

import '../models/categoryModel.dart';

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
}
