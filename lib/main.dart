import 'package:flutter/material.dart';
import 'package:loop/app/modules/homeScreen/inner_widgets/homeProvider.dart';
import 'package:loop/app/modules/splashScreen/splash_screen.dart';
import 'package:loop/app/modules/userprofileScreen/userprofileProvider.dart';
import 'package:provider/provider.dart';

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
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            fontFamily: "Lexend",
            primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          home: const SplashScreen()),
    );
  }
}
