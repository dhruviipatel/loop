import 'package:flutter/material.dart';
import 'package:loop/app/core/themes/themes.dart';
import 'package:loop/app/modules/authenticationScreens/Addprofile_screen.dart';
import 'package:loop/app/modules/authenticationScreens/inner_widget/goback.dart';
import 'package:loop/app/modules/authenticationScreens/login_screen.dart';
import 'package:velocity_x/velocity_x.dart';

import 'inner_widget/form_field.dart';

class SignupFormScreen extends StatelessWidget {
  const SignupFormScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: appbBgColor,
        body: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  goback(context: context),
                  Container(
                    width: 205,
                    height: 50,
                    decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(width: 2, color: Colors.white))),
                    child: Center(
                      child: Text(
                        "SignUp",
                        style: TextStyle(
                            fontSize: 21,
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                      ),
                    ),
                  ),
                  Container(
                    height: 10,
                    width: 10,
                  )
                ],
              ),
              SizedBox(height: 30),
              Expanded(
                child: SingleChildScrollView(
                  //reverse: false,
                  child: Column(
                    children: [
                      SizedBox(height: 30),
                      MyFormField(
                          inputType: TextInputType.name,
                          icon: Icons.person_outlined,
                          obsecureText: false,
                          hintText: "Name*"),
                      SizedBox(height: 26),
                      MyFormField(
                          inputType: TextInputType.datetime,
                          icon: Icons.calendar_month_outlined,
                          obsecureText: false,
                          hintText: "DOB*"),
                      SizedBox(height: 26),
                      MyFormField(
                          inputType: TextInputType.emailAddress,
                          icon: Icons.email_outlined,
                          obsecureText: false,
                          hintText: "Email Address"),
                      SizedBox(height: 26),
                      MyFormField(
                          inputType: TextInputType.visiblePassword,
                          icon: Icons.lock_open_outlined,
                          obsecureText: true,
                          hintText: "Password*"),
                      SizedBox(height: 26),
                      MyFormField(
                          inputType: TextInputType.visiblePassword,
                          icon: Icons.lock_open_outlined,
                          obsecureText: true,
                          hintText: "Confirm Password*"),
                      SizedBox(height: 26),
                      MyFormField(
                          inputType: TextInputType.visiblePassword,
                          icon: Icons.person_outlined,
                          obsecureText: false,
                          hintText: "Identity"),
                      SizedBox(height: 60),
                      InkWell(
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AddProfileSceen())),
                        child: Container(
                          height: 60,
                          width: context.screenWidth,
                          decoration: BoxDecoration(
                              color: appButtonColor,
                              borderRadius: BorderRadius.circular(10)),
                          child: Text(
                            "Next",
                            style: TextStyle(
                                fontWeight: FontWeight.w300,
                                fontSize: 21,
                                letterSpacing: 0.5,
                                color: Colors.white),
                          ).centered(),
                        ),
                      ),
                      SizedBox(height: 40),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Already have an account ? ",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: appHintTextColor)),
                          InkWell(
                            onTap: () => Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (context) => LoginScreen())),
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
            ],
          ),
        ),
      ),
    );
  }
}
