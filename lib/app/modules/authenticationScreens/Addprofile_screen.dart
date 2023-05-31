import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:loop/app/core/themes/themes.dart';
import 'package:velocity_x/velocity_x.dart';
import 'inner_widget/form_field.dart';
import 'inner_widget/goback.dart';
import 'login_screen.dart';

class AddProfileSceen extends StatelessWidget {
  const AddProfileSceen({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: appbBgColor,
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(30.0),
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
            SizedBox(height: 10),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
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
                      "Upload photo",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 21,
                          fontWeight: FontWeight.w500),
                    ),
                    SizedBox(height: 40),
                    Container(
                      decoration: BoxDecoration(
                        color: appbBgColor,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(50),
                            topRight: Radius.circular(50)),
                        boxShadow: [
                          BoxShadow(
                            color:
                                Color.fromARGB(50, 0, 0, 0), //color of shadow
                            spreadRadius: 5, //spread radius
                            blurRadius: 3,
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 30, right: 30),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                              width: 150,
                              height: 3,
                              color: Colors.white.withOpacity(0.5),
                            ),
                            SizedBox(
                              height: 35,
                            ),
                            MyFormField(
                                controller: "",
                                inputType: TextInputType.name,
                                icon: Icons.person_outlined,
                                obsecureText: false,
                                hintText: "User Id*"),
                            SizedBox(height: 26),
                            MyFormField(
                                controller: "",
                                inputType: TextInputType.name,
                                icon: Icons.person_outlined,
                                obsecureText: false,
                                hintText: "Name*"),
                            SizedBox(height: 26),
                            MyFormField(
                                controller: "",
                                inputType: TextInputType.name,
                                icon: Icons.person_outlined,
                                obsecureText: false,
                                hintText: "Gender"),
                            SizedBox(height: 26),
                            MyFormField(
                                controller: "",
                                inputType: TextInputType.datetime,
                                icon: Icons.calendar_month_outlined,
                                obsecureText: false,
                                hintText: "Contact Details"),
                            SizedBox(height: 26),
                            MyFormField(
                                controller: "",
                                inputType: TextInputType.emailAddress,
                                icon: Icons.email_outlined,
                                obsecureText: false,
                                hintText: "Email Address"),
                            SizedBox(height: 26),
                            MyFormField(
                                controller: "",
                                inputType: TextInputType.visiblePassword,
                                icon: Icons.lock_outlined,
                                obsecureText: true,
                                hintText: "Password*"),
                            SizedBox(height: 60),
                            InkWell(
                              onTap: () => Navigator.of(context)
                                  .pushReplacement(MaterialPageRoute(
                                      builder: (context) => LoginScreen())),
                              child: Container(
                                height: 60,
                                width: context.screenWidth,
                                decoration: BoxDecoration(
                                    color: appButtonColor,
                                    borderRadius: BorderRadius.circular(10)),
                                child: Text(
                                  "Sign-Up",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w300,
                                      fontSize: 21,
                                      letterSpacing: 0.5,
                                      color: Colors.white),
                                ).centered(),
                              ),
                            ),
                            SizedBox(height: 40),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Already have an account ? ",
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        color: appHintTextColor)),
                                InkWell(
                                  onTap: () => Navigator.of(context)
                                      .pushReplacement(MaterialPageRoute(
                                          builder: (context) => LoginScreen())),
                                  child: Text("Sign-In",
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                          color: appButtonColor)),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 50,
                            ),
                          ],
                        ),
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
