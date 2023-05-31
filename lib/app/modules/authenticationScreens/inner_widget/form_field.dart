import 'package:flutter/material.dart';

import '../../../core/themes/themes.dart';

Widget MyFormField(
    {required inputType,
    required controller,
    required icon,
    required String hintText,
    required bool obsecureText}) {
  return Container(
    height: 60,
    decoration: BoxDecoration(
        //color: Colors.grey,
        border: Border.all(width: 1, color: Colors.white),
        borderRadius: BorderRadius.circular(10)),
    child: Row(
      children: [
        Container(
          width: 60,
          child: Icon(icon, color: appHintTextColor),
        ),
        VerticalDivider(
          color: Colors.white,
          width: 1,
          thickness: 1,
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: TextField(
              controller: controller,
              keyboardType: inputType,
              obscureText: obsecureText,
              style: TextStyle(color: Colors.white, fontSize: 16),
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: hintText,
                  hintStyle: TextStyle(color: appHintTextColor)),
              cursorColor: Colors.white,
            ),
          ),
        )
      ],
    ),
  );
}
