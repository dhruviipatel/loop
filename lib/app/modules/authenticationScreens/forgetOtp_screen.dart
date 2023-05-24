import 'package:flutter/material.dart';
import 'package:loop/app/modules/authenticationScreens/inner_widget/otp.dart';
import 'package:loop/app/modules/authenticationScreens/resetpass_screen.dart';

class forgetOtpScreen extends StatelessWidget {
  const forgetOtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Otp(context: context, redirectScreen: ResetPassScreen()));
  }
}
