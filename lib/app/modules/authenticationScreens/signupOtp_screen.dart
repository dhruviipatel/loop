//continue verifyOTP funtion

import 'package:email_otp/email_otp.dart';
import 'package:flutter/material.dart';
import 'package:loop/app/modules/authenticationScreens/signupForm_screen.dart';
import 'package:pinput/pinput.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:velocity_x/velocity_x.dart';

import '../../core/themes/themes.dart';
import 'inner_widget/goback.dart';

class SignupOtpScreen extends StatefulWidget {
  const SignupOtpScreen({super.key, required this.myauth});
  final EmailOTP myauth;
  @override
  State<SignupOtpScreen> createState() => _SignupOtpScreenState();
}

class _SignupOtpScreenState extends State<SignupOtpScreen> {
  //String? eml;
  String eml1 = "";
  @override
  Widget build(BuildContext context) {
    // EmailAuth? emailAuth;
    return SafeArea(
        child: Scaffold(
      bottomSheet: BottomAppBar(
          height: 155,
          color: Color(0xff454545),
          elevation: 0,
          child: Center(
            child: InkWell(
              onTap: () async {
                SharedPreferences sp = await SharedPreferences.getInstance();
                var otpCode = sp.getString('otpCode');

                String? eml = sp.getString("signupEmail");
                if (eml != null) {
                  eml1 = eml;
                }
                if (await otpCode == null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Enter 6 digit OTP code")));
                } else {
                  if (await widget.myauth.verifyOTP(otp: otpCode) == true) {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text("OTP is verified successfully"),
                    ));
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SignupFormScreen(eml: eml1)));
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text("Invalid OTP"),
                    ));
                  }
                }
              },
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
                        bottom:
                            BorderSide(width: 1.5, color: Color(0xff383740)),
                      ),
                    ),
                  ),
                  onCompleted: (value) async {
                    SharedPreferences sp =
                        await SharedPreferences.getInstance();
                    setState(() {
                      var otpCode = value;
                      sp.setString('otpCode', otpCode);
                    });
                  },
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  "Resend code in 00:39",
                  style: TextStyle(
                      color: appHintTextColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ],
        ),
      ),
    ));
  }
}
