import 'package:dotted_border/dotted_border.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../core/themes/themes.dart';
import '../../data/providers/AuthProvider.dart';
import 'inner_widget/goback.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ap = Provider.of<AuthProvider>(context);
    ap.getUserData.call();
    var UimageController = new TextEditingController();
    var UidController = new TextEditingController();
    var UnameController = new TextEditingController();
    var UgenderController = new TextEditingController();
    var UmobileController = new TextEditingController();
    var UemailController = new TextEditingController();
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
                              hinttext: ap.user!.id.toString(),
                              controller: UidController,
                              validator: (value) {
                                if (value.isEmpty) {
                                  UidController.text = ap.user!.id.toString();
                                } else {
                                  UidController.text = value;
                                }
                              }),
                          EditProfileFields(
                              icon: Icons.person_outline,
                              title: "Name",
                              hinttext: ap.user!.name,
                              controller: UnameController,
                              validator: (value) {
                                if (value.isEmpty) {
                                  UnameController.text = ap.user!.name;
                                } else {
                                  UnameController.text = value;
                                }
                              }),
                          EditProfileFields(
                              icon: Icons.person_outline,
                              title: "Gender",
                              hinttext: ap.user!.gender.toString(),
                              controller: UgenderController,
                              validator: (value) {
                                if (value.isEmpty) {
                                  UgenderController.text =
                                      ap.user!.gender.toString();
                                } else {
                                  UgenderController.text = value;
                                }
                              }),
                          EditProfileFields(
                              icon: Icons.person_outline,
                              title: "Contact Details",
                              hinttext: ap.user?.mobile.toString(),
                              controller: UmobileController,
                              validator: (value) {
                                if (value.isEmpty) {
                                  UmobileController.text =
                                      ap.user!.mobile.toString();
                                } else {
                                  UmobileController.text = value;
                                }
                              }),
                          EditProfileFields(
                              icon: Icons.person_outline,
                              title: "Email Address",
                              hinttext: ap.user!.email,
                              controller: UemailController,
                              validator: (value) {
                                if (value.isEmpty) {
                                  UemailController.text = ap.user!.email;
                                } else {
                                  UemailController.text = value;
                                }
                              }),
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

Widget EditProfileFields(
    {required icon,
    required title,
    required hinttext,
    required controller,
    required validator}) {
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
      TextFormField(
        style: TextStyle(
            color: Colors.white, fontSize: 21, fontWeight: FontWeight.w400),
        cursorColor: Colors.white,
        decoration: InputDecoration(
          hintText: hinttext,
          hintStyle: TextStyle(color: Colors.white),
          isDense: true,
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
        ),
        validator: validator,
      ),
      SizedBox(
        height: 30,
      )
    ],
  );
}
