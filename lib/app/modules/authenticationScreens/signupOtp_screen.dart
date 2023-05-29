import 'package:flutter/material.dart';
import 'package:loop/app/core/utils/routes.dart';
import 'package:loop/app/modules/authenticationScreens/inner_widget/otp.dart';

class SignupOtpScreen extends StatelessWidget {
  const SignupOtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Otp(context: context, redirectScreen: MyRoute.signupFormRoute));
  }
}
