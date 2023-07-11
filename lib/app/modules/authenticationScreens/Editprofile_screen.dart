import 'dart:io';

import 'package:dotted_border/dotted_border.dart';

import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../core/themes/themes.dart';
import '../../data/providers/AuthProvider.dart';
import 'inner_widget/goback.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    File? image;
    var user = context.read<AuthProvider>().user;
    var userid = 0;
    var profileImage = "";
    var username = "";
    var gender = "";
    var mobile = "";
    var email = "";
    if (user != null) {
      userid = user.id;
      profileImage = user.profileImage;
      username = user.name;
      gender = user.gender.toString();
      mobile = user.mobile.toString();
      email = user.email.toString();
    }
    //var UimageController = new TextEditingController();

    var UnameController = new TextEditingController();
    var UgenderController = new TextEditingController();
    var UmobileController = new TextEditingController();
    var UemailController = new TextEditingController();
    return ChangeNotifierProvider<AuthProvider>(
      create: (BuildContext context) => AuthProvider()..getUserData(),
      child: Consumer(builder: (BuildContext context, aup, _) {
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
                          child: InkWell(
                            onTap: () {
                              context.read<AuthProvider>().selectImage(image);
                            },
                            child: profileImage.isEmpty
                                ? image == null
                                    ? Container(
                                        height: 100,
                                        width: 100,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(100),
                                        ),
                                        child: Image.asset(
                                            "assets/images/landscape.png"))
                                    : Container(
                                        height: 100,
                                        width: 100,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(100),
                                        ),
                                        child: Image.file(image),
                                      )
                                : Container(
                                    height: 100,
                                    width: 100,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(100),
                                      image: DecorationImage(
                                        image: NetworkImage(profileImage),
                                      ),
                                    ),
                                  ),
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
                        SizedBox(height: 30),
                        Padding(
                          padding: const EdgeInsets.only(left: 30, right: 30),
                          child: Column(
                            children: [
                              SizedBox(
                                height: 20,
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.person_outline,
                                    color: appHintTextColor,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    "User ID",
                                    style: TextStyle(
                                      color: appHintTextColor,
                                      fontSize: 16,
                                    ),
                                  )
                                ],
                              ),
                              5.heightBox,
                              Row(
                                children: [
                                  Text(
                                    userid.toString(),
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 21),
                                  ),
                                ],
                              ),
                              Divider(
                                color: Colors.white,
                                thickness: 1,
                              ),
                              20.heightBox,
                              EditProfileFields(
                                  icon: Icons.person_outline,
                                  title: "Name",
                                  hinttext: username,
                                  controller: UnameController,
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      UnameController.text = username;
                                    } else {
                                      UnameController.text = value;
                                    }
                                  }),
                              Row(
                                children: [
                                  Icon(
                                    Icons.person_outline,
                                    color: appHintTextColor,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    "Gender",
                                    style: TextStyle(
                                      color: appHintTextColor,
                                      fontSize: 16,
                                    ),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: RadioListTile(
                                        contentPadding: EdgeInsets.all(0.0),
                                        visualDensity:
                                            VisualDensity(horizontal: -4),
                                        title: Text(
                                          "Male",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                        value: 1.toString(),
                                        groupValue: gender,
                                        onChanged: (val) {
                                          gender = val.toString();
                                          UgenderController.text = gender;
                                        }),
                                  ),
                                  Expanded(
                                    child: RadioListTile(
                                        contentPadding: EdgeInsets.zero,
                                        visualDensity:
                                            VisualDensity(horizontal: -4),
                                        title: Text(
                                          "Female",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                        value: 0.toString(),
                                        groupValue: gender,
                                        onChanged: (val) {
                                          if (val!.isNotEmpty) {
                                            context
                                                .read<AuthProvider>()
                                                .setSelectedOption(val, gender);
                                            context
                                                .read<AuthProvider>()
                                                .getUserData();
                                          }
                                        }),
                                  ),
                                ],
                              ),
                              10.heightBox,
                              EditProfileFields(
                                  icon: Icons.phone,
                                  title: "Contact Details",
                                  hinttext: mobile,
                                  controller: UmobileController,
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      UmobileController.text = mobile;
                                    } else {
                                      UmobileController.text = value;
                                    }
                                  }),
                              EditProfileFields(
                                  icon: MdiIcons.fileDocumentOutline,
                                  title: "Email Address",
                                  hinttext: email,
                                  controller: UemailController,
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      UemailController.text = email;
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
      }),
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
