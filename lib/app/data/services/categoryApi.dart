import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:loop/app/data/models/categoryModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CategoryApi {
  List catalist = [];
  static fechCategory() async {
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
      List.from(data)
          .map<Category>(
            (e) => Category.fromJson(e),
          )
          .toList();
    } else {
      throw Exception('failed to load categories');
    }
  }
}
