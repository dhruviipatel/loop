import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:loop/app/modules/bottomNavbar.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../modules/authenticationScreens/login_screen.dart';
import 'package:http/http.dart' as http;

import '../models/userModel.dart';

class AuthProvider with ChangeNotifier {
  User? _user;
  User? get user => _user;

  //check login status on login page
  void checkLogin(context) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    if (sp != null) {
      String? val = sp.getString('token');
      if (val != null) {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
              builder: (context) => BottomNavbar(),
            ),
            (route) => false);
      }
    } else {
      print("sp is null");
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
      var userdata = data['user'];
      if (userdata == null) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("Invalid credentials")));
      } else {
        if (response.statusCode == 200) {
          SharedPreferences sp = await SharedPreferences.getInstance();
          //store token

          await sp.setString("token", data['token']);

          //store users info into shared pref

          User user = User(
            id: userdata['id'],
            name: userdata['name'],
            email: userdata['email'],
            mobile: userdata['mobile'],
            dob: DateTime.parse(
              userdata['dob'],
            ),
            gender: userdata['gender'] ?? 0,
            profileImage: userdata['profile_image'],
            identify: userdata['identity'],
          );

          String userinfo = jsonEncode(user);
          //print("user info:${userinfo}");

          sp.setString('userinfo', userinfo);

          //navigate to homepage

          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => BottomNavbar()),
              (Route<dynamic> route) => false);
        } else {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text("Invalid credentials")));
        }
      }
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Please Enter Credentials")));
    }
  }

  //get saved data from shared pref

  void getUserData() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    String? userinfo = sp.getString('userinfo');

    if (userinfo != null) {
      Map<String, dynamic> userjsondata = jsonDecode(userinfo);
      _user = User.fromJson(userjsondata);
    }
    notifyListeners();
  }

  //logout button code
  void Logout(context) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.clear();
    Navigator.of(context, rootNavigator: true).pushAndRemoveUntil(
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

  void setSelectedOption(String option, gender) async {
    gender = option;
    //getUserData();
    notifyListeners();
  }

  void selectImage(image) async {
    image = await pickImage();
    notifyListeners();
  }

  Future<File?> pickImage() async {
    File? image;
    try {
      final pickedImage =
          await ImagePicker().pickImage(source: ImageSource.gallery);
      if (pickedImage != null) {
        image = File(pickedImage.path);
        notifyListeners();
      }
    } catch (e) {
      // showSnackBar(context, e.toString());
    }
    return image;
  }
}
