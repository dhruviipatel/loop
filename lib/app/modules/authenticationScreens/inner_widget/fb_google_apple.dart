import 'package:flutter/material.dart';

Widget Links(
    {required String linkmethod, required String imagename, required onTap}) {
  return InkWell(
    onTap: onTap,
    child: Container(
      height: 41,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Color(0xff7c7b7b), width: 1),
          color: Color(0xff5c5c5c)),
      child: Padding(
        padding: const EdgeInsets.only(left: 68),
        child: Row(
          children: [
            Container(
                width: 24, child: Image.asset("assets/images/$imagename")),
            SizedBox(
              width: 8,
            ),
            Text(
              "Continue with $linkmethod",
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.white),
            ),
          ],
        ),
      ),
    ),
  );
}
