import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:loop/app/modules/bottomNavbar.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../modules/authenticationScreens/login_screen.dart';
import '../models/categoryModel.dart';
import '../services/categoryApi.dart';
import 'package:http/http.dart' as http;

class AuthProvider with ChangeNotifier {
  bool isLoading = false;
  List<Category> catagories = [];

  dataController() {
    fechCategories();
  }

  fechCategories() async {
    isLoading = true;

    notifyListeners();

    catagories = await CategoryApi.fechCategory();
    isLoading = false;
    notifyListeners();
  }

  //check login status on login page
  void checkLogin(context) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    String? val = sp.getString('token');
    if (val != null) {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
            builder: (context) => BottomNavbar(),
          ),
          (route) => false);
    }
  }

  //login button code
  void Login(String email, String password, context) async {
    if (email.isNotEmpty && password.isNotEmpty) {
      var response = await http.post(
          Uri.parse("https://looptest.inventdi.com/api/login"),
          body: {'email': email, 'password': password});
      var jsonData = json.decode(response.body);
      var data = jsonData['data'];

      if (response.statusCode == 200) {
        SharedPreferences sp = await SharedPreferences.getInstance();
        await sp.setString("token", data['token']);
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => BottomNavbar()),
            (Route<dynamic> route) => false);
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("Invalid credentials")));
      }
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Please Enter Credentials")));
    }
  }

  //logout button code
  void Logout(context) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.clear();
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (context) => LoginScreen(),
        ),
        (Route<dynamic> route) => false);
  }

  //check login status on homepage
  checkLoginStatus(context) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp = await SharedPreferences.getInstance();
    if (sp.getString('token') == null) {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
            builder: (context) => LoginScreen(),
          ),
          (Route<dynamic> route) => false);
    }
  }

  //get token
  getToken() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    var token = sp.getString("token")!;
    return token;
  }
}
