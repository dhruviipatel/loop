import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../core/themes/themes.dart';
import 'goback.dart';

Widget Otp({required redirectScreen, required context}) {
  return Scaffold(
    bottomSheet: BottomAppBar(
        height: 155,
        color: Color(0xff454545),
        elevation: 0,
        child: Center(
          child: InkWell(
            onTap: () => Navigator.of(context).pushNamed(redirectScreen),
            child: Container(
              height: 60,
              width: 296,
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
        )),
    backgroundColor: Color(0xff454545),
    body: Padding(
      padding: const EdgeInsets.all(30.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          goback(context: context),
          SizedBox(
            height: 50,
          ),
          Column(
            children: [
              Text(
                "Enter 6 digit verification code sent to your Email",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 21,
                    height: 1.4,
                    fontWeight: FontWeight.w400),
              ),
              SizedBox(height: 70),
              Pinput(
                length: 6,
                defaultPinTheme: PinTheme(
                  textStyle: TextStyle(color: Colors.white, fontSize: 21),
                  height: 45,
                  width: 45,
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(width: 1.5, color: Color(0xff383740)),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30),
              Text(
                "Resend code in 00:39",
                style: TextStyle(
                    color: appHintTextColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w400),
              )
            ],
          ),
        ],
      ),
    ),
  );
}
