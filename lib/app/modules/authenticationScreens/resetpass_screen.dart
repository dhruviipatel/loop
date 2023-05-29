import 'package:flutter/material.dart';
import 'package:loop/app/core/themes/themes.dart';
import 'package:loop/app/modules/authenticationScreens/login_screen.dart';
import 'package:velocity_x/velocity_x.dart';

import 'inner_widget/form_field.dart';
import 'inner_widget/goback.dart';

class ResetPassScreen extends StatelessWidget {
  const ResetPassScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: appbBgColor,
        bottomSheet: BottomAppBar(
            height: 100,
            color: Color(0xff454545),
            elevation: 0,
            child: Center(
              child: Column(
                children: [
                  InkWell(
                    onTap: () => Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => LoginScreen())),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 30, right: 30),
                      child: Container(
                        height: 60,
                        width: context.screenWidth,
                        decoration: BoxDecoration(
                            color: appButtonColor,
                            borderRadius: BorderRadius.circular(10)),
                        child: Text(
                          "Create & Save",
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 21,
                              letterSpacing: 0.5,
                              color: Colors.white),
                        ).centered(),
                      ),
                    ),
                  ),
                ],
              ),
            )),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(30, 50, 30, 0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  goback(context: context),
                  Text(
                    "Reset Password",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 21,
                        fontWeight: FontWeight.w400),
                  ),
                  Container(
                    height: 10,
                    width: 10,
                  )
                ],
              ),
              SizedBox(height: 50),
              Container(
                width: 278,
                child: Text(
                  "Your new password must be different from previously used password",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: appHintTextColor,
                      fontSize: 20,
                      height: 1.5,
                      fontWeight: FontWeight.w300),
                ),
              ),
              SizedBox(height: 70),
              MyFormField(
                  inputType: TextInputType.emailAddress,
                  icon: Icons.lock_outline,
                  obsecureText: true,
                  hintText: "New Password"),
              SizedBox(height: 30),
              MyFormField(
                  inputType: TextInputType.emailAddress,
                  icon: Icons.lock_outline,
                  obsecureText: true,
                  hintText: "Confirm Password")
            ],
          ),
        ),
      ),
    );
  }
}
