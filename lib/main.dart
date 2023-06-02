import 'package:flutter/material.dart';
import 'package:loop/app/data/providers/AuthProvider.dart';
import 'package:loop/app/modules/authenticationScreens/forgetOtp_screen.dart';
import 'package:loop/app/modules/authenticationScreens/forgotpass_screen.dart';
import 'package:loop/app/modules/authenticationScreens/login_screen.dart';
import 'package:loop/app/modules/authenticationScreens/resetpass_screen.dart';
import 'package:loop/app/modules/homeScreen/home_screen.dart';
import 'package:loop/app/modules/homeScreen/inner_widgets/postClick.dart';
import 'package:loop/app/modules/splashScreen/splash_screen.dart';
import 'package:loop/app/modules/userprofileScreen/userprofileProvider.dart';
import 'package:provider/provider.dart';
import 'app/core/utils/routes.dart';
import 'app/data/providers/BottomNavbarProvider.dart';
import 'app/data/providers/HomeProvider.dart';
import 'app/data/providers/SearchProvider.dart';
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
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => BottomNavbarProvider()),
        ChangeNotifierProvider(create: (_) => HomeProvider()),
        ChangeNotifierProvider(create: (_) => UserProfileProvider()),
        ChangeNotifierProvider(create: (_) => EditNavbarProvider()),
        ChangeNotifierProvider(create: (_) => SearchProvider()),
      ],
      child: DismissKeyboard(
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            fontFamily: "Lexend",
            primarySwatch: Colors.orange,
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
            MyRoute.onPostclickRoute: (context) => PostClick(),
          },
        ),
      ),
    );
  }
}

// The DismissKeybaord widget (it's reusable)
class DismissKeyboard extends StatelessWidget {
  final Widget child;
  const DismissKeyboard({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus &&
            currentFocus.focusedChild != null) {
          FocusManager.instance.primaryFocus?.unfocus();
        }
      },
      child: child,
    );
  }
}
