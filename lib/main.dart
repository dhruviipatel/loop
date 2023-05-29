import 'package:flutter/material.dart';
import 'package:loop/app/modules/authenticationScreens/Addprofile_screen.dart';
import 'package:loop/app/modules/authenticationScreens/forgetOtp_screen.dart';
import 'package:loop/app/modules/authenticationScreens/forgotpass_screen.dart';
import 'package:loop/app/modules/authenticationScreens/login_screen.dart';
import 'package:loop/app/modules/authenticationScreens/resetpass_screen.dart';
import 'package:loop/app/modules/authenticationScreens/signupForm_screen.dart';
import 'package:loop/app/modules/authenticationScreens/signupOtp_screen.dart';
import 'package:loop/app/modules/homeScreen/home_screen.dart';
import 'package:loop/app/modules/homeScreen/inner_widgets/homeProvider.dart';
import 'package:loop/app/modules/homeScreen/inner_widgets/postClick.dart';
import 'package:loop/app/modules/splashScreen/splash_screen.dart';
import 'package:loop/app/modules/userprofileScreen/userprofileProvider.dart';
import 'package:provider/provider.dart';

import 'app/core/utils/routes.dart';
import 'app/modules/newpostScreen/editpost/editnavbarProvider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => HomeProvider()),
        ChangeNotifierProvider(create: (_) => UserProfileProvider()),
        ChangeNotifierProvider(create: (_) => EditNavbarProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: "Lexend",
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        initialRoute: "/",
        routes: {
          "/": (context) => SplashScreen(),
          MyRoute.loginRoute: (context) => LoginScreen(),
          MyRoute.homeRoute: (context) => HomeScreen(),
          MyRoute.forgotpassRoute: (context) => ForgotPassScreen(),
          MyRoute.forgotpassotpRoute: (context) => forgetOtpScreen(),
          MyRoute.resetpassRoute: (context) => ResetPassScreen(),
          MyRoute.signupOtpRoute: (context) => SignupOtpScreen(),
          MyRoute.signupFormRoute: (context) => SignupFormScreen(),
          MyRoute.AddprofileRoute: (context) => AddProfileSceen(),
          MyRoute.onPostclickRoute: (context) => PostClick(),
        },
      ),
    );
  }
}
