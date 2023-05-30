import 'package:flutter/material.dart';
import 'package:loop/app/core/themes/themes.dart';

class BrightnessScreen extends StatelessWidget {
  const BrightnessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appbBgColor,
      bottomSheet: BottomSheet(
        backgroundColor: appbBgColor,
        onClosing: () {},
        enableDrag: false,
        builder: (context) {
          return Padding(
            padding: const EdgeInsets.all(30),
            child: Container(
              height: 66,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding: const EdgeInsets.only(left: 16, right: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset("assets/images/brightness2.png"),
                    Image.asset("assets/images/brightness3.png"),
                    Image.asset("assets/images/brightness4.png"),
                    Image.asset("assets/images/brightness5.png"),
                    Image.asset("assets/images/brightness6.png")
                  ],
                ),
              ),
            ),
          );
        },
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
        child: Container(
          height: 450,
          width: MediaQuery.of(context).size.width,
          child: Image.asset(
            "assets/images/cropimg.png",
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
