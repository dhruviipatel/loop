import 'package:flutter/material.dart';
import 'package:loop/app/core/themes/themes.dart';
import 'package:loop/app/modules/authenticationScreens/forgetOtp_screen.dart';
import 'package:loop/app/modules/authenticationScreens/inner_widget/form_field.dart';
import 'package:loop/app/modules/authenticationScreens/inner_widget/goback.dart';
import 'package:velocity_x/velocity_x.dart';

class ForgotPassScreen extends StatelessWidget {
  const ForgotPassScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: appbBgColor,
        bottomSheet: BottomAppBar(
            height: 155,
            color: Color(0xff454545),
            elevation: 0,
            child: Center(
              child: Column(
                children: [
                  InkWell(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => forgetOtpScreen())),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 30, right: 30),
                      child: Container(
                        height: 60,
                        width: context.screenWidth,
                        decoration: BoxDecoration(
                            color: appButtonColor,
                            borderRadius: BorderRadius.circular(10)),
                        child: Text(
                          "Next",
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 21,
                              letterSpacing: 0.5,
                              color: Colors.white),
                        ).centered(),
                      ),
                    ),
                  ),
                  SizedBox(height: 40),
                  InkWell(
                    onTap: () => Navigator.pop(context),
                    child: Text(
                      "Back To Login",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: appHintTextColor),
                    ),
                  )
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
                    "Forgot Password",
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
              SizedBox(height: 60),
              Text(
                "Forgot your password?",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 14),
              Text(
                "Enter your register email below to recieve password reset instruction",
                style: TextStyle(
                    color: appHintTextColor,
                    fontSize: 20,
                    height: 1.5,
                    fontWeight: FontWeight.w300),
              ),
              SizedBox(height: 70),
              MyFormField(
                  inputType: TextInputType.emailAddress,
                  obsecureText: false,
                  icon: Icons.email_outlined,
                  hintText: "E-Mail")
            ],
          ),
        ),
      ),
    );
  }
}
