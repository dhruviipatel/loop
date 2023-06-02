import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:loop/app/core/themes/themes.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:velocity_x/velocity_x.dart';
import 'inner_widget/form_field.dart';
import 'login_screen.dart';

class SignupFormScreen extends StatefulWidget {
  final String eml;
  const SignupFormScreen({super.key, required this.eml});

  @override
  State<SignupFormScreen> createState() => _SignupFormScreenState();
}

class _SignupFormScreenState extends State<SignupFormScreen> {
  var nameController = new TextEditingController();
  var genderController = new TextEditingController();
  var contactnoController = new TextEditingController();
  var emailController = new TextEditingController();
  var passController = new TextEditingController();
  var cpassController = new TextEditingController();
  var dobController = new TextEditingController();
  var identityController = new TextEditingController();
  String s1 = "email";
  @override
  void initState() {
    getSp();
    super.initState();
  }

  getSp() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    String? myemail = sp.getString("signupEmail");
    if (myemail != null) {
      setState(() {
        s1 = myemail;
      });
    }
  }

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: appbBgColor,
        body: Form(
          key: _formkey,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  width: 205,
                  height: 50,
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(width: 2, color: Colors.white))),
                  child: Center(
                    child: Text(
                      "SignUp",
                      style: TextStyle(
                          fontSize: 21,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                    ),
                  ),
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
                                controller: nameController,
                                inputType: TextInputType.name,
                                icon: Icons.person_outlined,
                                obsecureText: false,
                                hintText: "Name*",
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Name is required";
                                  }
                                  return null;
                                },
                              ),
                              SizedBox(height: 26),
                              Container(
                                height: 60,
                                decoration: BoxDecoration(
                                    //color: Colors.grey,
                                    border: Border.all(
                                        width: 1, color: Colors.white),
                                    borderRadius: BorderRadius.circular(10)),
                                child: Row(
                                  children: [
                                    Container(
                                      width: 60,
                                      child: Icon(Icons.calendar_month_outlined,
                                          color: appHintTextColor),
                                    ),
                                    VerticalDivider(
                                      color: Colors.white,
                                      width: 1,
                                      thickness: 1,
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 20, right: 20),
                                        child: TextFormField(
                                          onTap: () async {
                                            DateTime? pickedDate =
                                                await showDatePicker(
                                                    context: context,
                                                    initialDate: DateTime.now(),
                                                    firstDate: DateTime(1960),
                                                    lastDate: DateTime.now());

                                            if (pickedDate != null) {
                                              setState(() {
                                                dobController.text =
                                                    //'${pickedDate}';
                                                    '${pickedDate.day}-${pickedDate.month}-${pickedDate.year}';
                                              });
                                            }
                                          },
                                          controller: dobController,
                                          keyboardType: TextInputType.datetime,
                                          validator: (value) {
                                            if (value!.isEmpty) {
                                              return "DOB is required";
                                            }
                                            return null;
                                          },
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16),
                                          decoration: InputDecoration(
                                              border: InputBorder.none,
                                              hintText: "DOB*",
                                              hintStyle: TextStyle(
                                                  color: appHintTextColor)),
                                          cursorColor: Colors.white,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(height: 26),
                              MyFormField(
                                controller: genderController,
                                inputType: TextInputType.name,
                                icon: Icons.person_outlined,
                                obsecureText: false,
                                hintText: "Gender",
                                validator: (value) {},
                              ),
                              SizedBox(height: 26),
                              MyFormField(
                                controller: contactnoController,
                                inputType: TextInputType.datetime,
                                icon: Icons.calendar_month_outlined,
                                obsecureText: false,
                                hintText: "Contact Number",
                                validator: (value) {},
                              ),
                              SizedBox(height: 26),
                              Container(
                                height: 60,
                                decoration: BoxDecoration(
                                    //color: Colors.grey,
                                    border: Border.all(
                                        width: 1, color: Colors.white),
                                    borderRadius: BorderRadius.circular(10)),
                                child: Row(
                                  children: [
                                    Container(
                                      width: 60,
                                      child: Icon(Icons.email_outlined,
                                          color: appHintTextColor),
                                    ),
                                    VerticalDivider(
                                      color: Colors.white,
                                      width: 1,
                                      thickness: 1,
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 20, right: 20),
                                        child: TextFormField(
                                          readOnly: true,
                                          controller: emailController,
                                          keyboardType:
                                              TextInputType.emailAddress,
                                          validator: (value) {
                                            emailController.text = widget.eml;
                                            return null;
                                          },
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16),
                                          decoration: InputDecoration(
                                              border: InputBorder.none,
                                              hintText: "${widget.eml}",
                                              hintStyle: TextStyle(
                                                  color: appHintTextColor)),
                                          cursorColor: Colors.white,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(height: 26),
                              MyFormField(
                                controller: passController,
                                inputType: TextInputType.visiblePassword,
                                icon: Icons.lock_outlined,
                                obsecureText: true,
                                hintText: "Password*",
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Password is required";
                                  }
                                  return null;
                                },
                              ),
                              SizedBox(height: 26),
                              MyFormField(
                                controller: cpassController,
                                inputType: TextInputType.visiblePassword,
                                icon: Icons.lock_open_outlined,
                                obsecureText: true,
                                hintText: "Confirm Password*",
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Confirm Password is required";
                                  }
                                  if (passController.text !=
                                      cpassController.text) {
                                    return "Confirm Password do not match with Password";
                                  }
                                  return null;
                                },
                              ),
                              SizedBox(height: 26),
                              MyFormField(
                                controller: identityController,
                                inputType: TextInputType.visiblePassword,
                                icon: Icons.person_outlined,
                                obsecureText: false,
                                hintText: "Identity",
                                validator: (value) {},
                              ),
                              SizedBox(height: 60),
                              InkWell(
                                onTap: () {
                                  if (_formkey.currentState!.validate()) {
                                    Registeruser();
                                    print("successfull");
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => LoginScreen(),
                                        ));
                                  } else {
                                    print("Unsuccessfull");
                                  }
                                },
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
                                            builder: (context) =>
                                                LoginScreen())),
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
      ),
    );
  }

  Future Registeruser() async {
    var registerAPI = "https://looptest.inventdi.com/api/register";
    Map mapdata = {
      'name': nameController.text,
      'dob': dobController.text,
      'gender': genderController.text,
      'mobile': contactnoController.text,
      'email': emailController.text,
      'password': passController.text,
      'confirmed': cpassController.text,
      'identify': identityController.text
    };

    print("JSON data: ${mapdata}");

    var response = await http.post(Uri.parse(registerAPI), body: mapdata);
    var data = jsonDecode(response.body);

    print(" data: ${data}");
  }
}
