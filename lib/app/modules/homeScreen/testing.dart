import 'package:flutter/material.dart';

class Testing extends StatelessWidget {
  const Testing({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Container(
        width: 320.0,
        height: 180.0,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/profile.png"),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.6), BlendMode.darken),
          ),
        ),
      )),
    );
  }
}

class Constants {
  static const String FirstItem = 'First Item';
  static const String SecondItem = 'Second Item';
  static const String ThirdItem = 'Third Item';

  static const List<String> choices = <String>[
    FirstItem,
    SecondItem,
    ThirdItem,
  ];
}

void choiceAction(String choice) {
  if (choice == Constants.FirstItem) {
    print('I First Item');
  } else if (choice == Constants.SecondItem) {
    print('I Second Item');
  } else if (choice == Constants.ThirdItem) {
    print('I Third Item');
  }
}
