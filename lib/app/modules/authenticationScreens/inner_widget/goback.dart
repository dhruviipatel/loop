import 'package:flutter/material.dart';

Widget goback({required context}) {
  return InkWell(
    onTap: () => Navigator.pop(context),
    child: Container(
      height: 30,
      width: 30,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.white),
          borderRadius: BorderRadius.circular(5)),
      child: Padding(
        padding: const EdgeInsets.only(left: 5),
        child: Icon(
          Icons.arrow_back_ios,
          color: Colors.white,
          size: 15,
        ),
      ),
    ),
  );
}
