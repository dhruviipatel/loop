import 'package:flutter/material.dart';
import 'package:loop/app/core/themes/themes.dart';
import 'package:loop/app/modules/authenticationScreens/inner_widget/form_field.dart';
import 'package:loop/app/modules/authenticationScreens/login_screen.dart';
import '../../core/utils/routes.dart';
import 'inner_widget/fb_google_apple.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: appbBgColor,
        body: Center(
          child: Padding(
            padding: const EdgeInsets.only(left: 30, right: 30),
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
                SizedBox(
                  height: 50,
                ),
                MyFormField(
                    controller: "",
                    inputType: TextInputType.emailAddress,
                    obsecureText: false,
                    icon: Icons.email_outlined,
                    hintText: "E-Mail Address"),
                SizedBox(
                  height: 40,
                ),
                InkWell(
                  onTap: () =>
                      Navigator.of(context).pushNamed(MyRoute.signupOtpRoute),
                  child: Container(
                    height: 60,
                    decoration: BoxDecoration(
                        color: appButtonColor,
                        borderRadius: BorderRadius.circular(10)),
                    child: Center(
                      child: Text(
                        "Continue",
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
                SizedBox(height: 11),
                Links(
                    linkmethod: "google",
                    imagename: "google.png",
                    onTap: () {}),
                SizedBox(
                  height: 11,
                ),
                Links(
                    linkmethod: "apple", imagename: "apple.png", onTap: () {}),
                SizedBox(
                  height: 57,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Already have an account ? ",
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: appHintTextColor)),
                    InkWell(
                      onTap: () => Navigator.of(context)
                          .pushReplacement(MaterialPageRoute(
                        builder: (context) => LoginScreen(),
                      )),
                      child: Text("Sign-in",
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: appButtonColor)),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
