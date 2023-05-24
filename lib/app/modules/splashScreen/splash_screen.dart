import 'dart:async';

import 'package:flutter/material.dart';
import 'package:loop/app/core/themes/themes.dart';
import 'package:loop/app/modules/authenticationScreens/login_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => LoginScreen()));
    });
    return SafeArea(
      child: Scaffold(
        backgroundColor: appbBgColor,
        body: Center(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("assets/images/logo.png"),
                SizedBox(
                  height: 15,
                ),
                Text(
                  "Find Your Perfect Post Here",
                  style: TextStyle(
                      color: appHintTextColor,
                      fontWeight: FontWeight.w400,
                      fontSize: 18,
                      fontFamily: "lexend"),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
