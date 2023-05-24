import 'package:flutter/material.dart';
import 'package:loop/app/core/themes/themes.dart';
import 'package:loop/app/modules/authenticationScreens/forgotpass_screen.dart';
import 'package:loop/app/modules/authenticationScreens/inner_widget/form_field.dart';
import 'package:loop/app/modules/bottomNavbar.dart';
import 'package:loop/app/modules/homeScreen/home_screen.dart';
import 'inner_widget/fb_google_apple.dart';
import 'signup_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: appbBgColor,
        body: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(top: 80, left: 30, right: 30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("assets/images/logo.png"),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    "Welcome to loop",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 18,
                        fontFamily: "lexend"),
                  ),
                  SizedBox(height: 50),
                  MyFormField(
                      inputType: TextInputType.emailAddress,
                      icon: Icons.email_outlined,
                      obsecureText: false,
                      hintText: "E-Mail Address"),
                  SizedBox(height: 24),
                  MyFormField(
                      inputType: TextInputType.visiblePassword,
                      icon: Icons.email_outlined,
                      obsecureText: true,
                      hintText: "Password"),
                  SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(),
                      InkWell(
                        onTap: () =>
                            Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => ForgotPassScreen(),
                        )),
                        child: Text(
                          "Forgot Password?",
                          style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                              color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 23),
                  InkWell(
                    onTap: () => Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => BottomNavbar())),
                    child: Container(
                      height: 60,
                      decoration: BoxDecoration(
                          color: appButtonColor,
                          borderRadius: BorderRadius.circular(10)),
                      child: Center(
                        child: Text(
                          "Sign In",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 21,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  Text(
                    "OR",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  Links(
                      linkmethod: "facebook",
                      imagename: "facebook.png",
                      onTap: () {}),
                  SizedBox(
                    height: 11,
                  ),
                  Links(
                      linkmethod: "google",
                      imagename: "google.png",
                      onTap: () {}),
                  SizedBox(
                    height: 11,
                  ),
                  Links(
                      linkmethod: "apple",
                      imagename: "apple.png",
                      onTap: () {}),
                  SizedBox(
                    height: 50,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Create a new account ? ",
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: appHintTextColor)),
                      InkWell(
                        onTap: () => Navigator.of(context)
                            .pushReplacement(MaterialPageRoute(
                          builder: (context) => SignupScreen(),
                        )),
                        child: Text("Sign-Up ",
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: appButtonColor)),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
