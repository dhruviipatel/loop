import 'package:dotted_border/dotted_border.dart';

import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../core/themes/themes.dart';
import 'inner_widget/goback.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: appbBgColor,
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 30, 30, 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  goback(context: context),
                  Container(
                    width: 205,
                    height: 50,
                    child: Center(
                      child: Text(
                        "Profile Page",
                        style: TextStyle(
                            fontSize: 21,
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                      ),
                    ),
                  ),
                  Container(
                    height: 10,
                    width: 10,
                  )
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: 20),
                    DottedBorder(
                      color: Colors.white,
                      borderType: BorderType.Circle,
                      dashPattern: [6, 3],
                      child: Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: Image.asset("assets/images/landscape.png"),
                      ),
                    ),
                    SizedBox(height: 18),
                    Text(
                      "Edit",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 21,
                          fontWeight: FontWeight.w500),
                    ),
                    SizedBox(height: 40),
                    Padding(
                      padding: const EdgeInsets.only(left: 30, right: 30),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          EditProfileFields(
                              icon: Icons.person_outline,
                              title: "User Id",
                              value: "User Id"),
                          EditProfileFields(
                              icon: Icons.person_outline,
                              title: "Name",
                              value: "Jenny Watsaon"),
                          EditProfileFields(
                              icon: Icons.person_outline,
                              title: "Gender",
                              value: "Female"),
                          EditProfileFields(
                              icon: Icons.person_outline,
                              title: "Contact Details",
                              value: "Contact Details"),
                          EditProfileFields(
                              icon: Icons.person_outline,
                              title: "Email Address",
                              value: "dummy@gmail.com"),
                          SizedBox(
                            height: 20,
                          ),
                          InkWell(
                            onTap: () => Navigator.pop(context),
                            child: Container(
                              height: 60,
                              width: context.screenWidth,
                              decoration: BoxDecoration(
                                  color: appButtonColor,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Text(
                                "Save",
                                style: TextStyle(
                                    fontWeight: FontWeight.w300,
                                    fontSize: 21,
                                    letterSpacing: 0.5,
                                    color: Colors.white),
                              ).centered(),
                            ),
                          ),
                          SizedBox(height: 40),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget EditProfileFields({required icon, required title, required value}) {
  return Column(
    children: [
      Row(
        children: [
          Icon(
            icon,
            color: appHintTextColor,
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            title,
            style: TextStyle(
              color: appHintTextColor,
              fontSize: 16,
            ),
          )
        ],
      ),
      TextField(
        style: TextStyle(
            color: Colors.white, fontSize: 21, fontWeight: FontWeight.w400),
        cursorColor: Colors.white,
        decoration: InputDecoration(
          hintText: value,
          hintStyle: TextStyle(color: Colors.white),
          isDense: true,
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
        ),
      ),
      SizedBox(
        height: 30,
      )
    ],
  );
}
