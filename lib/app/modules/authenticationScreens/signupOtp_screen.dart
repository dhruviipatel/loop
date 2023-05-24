import 'package:flutter/material.dart';
import 'package:loop/app/modules/authenticationScreens/inner_widget/otp.dart';
import 'package:loop/app/modules/authenticationScreens/signupForm_screen.dart';

class SignupOtpScreen extends StatelessWidget {
  const SignupOtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Otp(context: context, redirectScreen: SignupFormScreen()));
  }
}
