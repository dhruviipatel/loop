import 'package:email_otp/email_otp.dart';
import 'package:flutter/material.dart';
import 'package:loop/app/core/themes/themes.dart';
import 'package:loop/app/modules/authenticationScreens/inner_widget/form_field.dart';
import 'package:loop/app/modules/authenticationScreens/login_screen.dart';
import 'package:loop/app/modules/authenticationScreens/signupOtp_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'inner_widget/fb_google_apple.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

class _SignupScreenState extends State<SignupScreen> {
  TextEditingController emailController = new TextEditingController();
  EmailOTP myauth = EmailOTP();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: appbBgColor,
        body: Center(
          child: Padding(
            padding: const EdgeInsets.only(left: 30, right: 30),
            child: Form(
              key: _formkey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("assets/images/logo.png"),
                  SizedBox(height: 15),
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
                    controller: emailController,
                    inputType: TextInputType.emailAddress,
                    obsecureText: false,
                    icon: Icons.email_outlined,
                    hintText: "E-Mail Address",
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please enter email";
                      }
                      if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                          .hasMatch(value)) {
                        return "Please enter valid email";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 40),
                  InkWell(
                    onTap: () async {
                      if (_formkey.currentState!.validate()) {
                        print("successfull");

                        //send otp
                        myauth.setConfig(
                            appEmail: "dhruvi.digitalinovation@gmail.com",
                            appName: "Loop",
                            userEmail: emailController.text,
                            otpLength: 6,
                            otpType: OTPType.digitsOnly);
                        if (await myauth.sendOTP() == true) {
                          //store value of email so we can directly use it in signup form
                          SharedPreferences sp =
                              await SharedPreferences.getInstance();
                          sp.setString("signupEmail", emailController.text);

                          //show message in snackbar and naviagte
                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                            content: Text("OTP has been sent"),
                          ));
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) =>
                                SignupOtpScreen(myauth: myauth),
                          ));
                        } else {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                            content: Text("Oops, OTP send failed"),
                          ));
                        }
                      } else {
                        print("Unsuccessfull");
                      }
                    },
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
                      linkmethod: "apple",
                      imagename: "apple.png",
                      onTap: () {}),
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
      ),
    );
  }
}
