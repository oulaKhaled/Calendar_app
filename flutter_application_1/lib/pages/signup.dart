import 'package:flutter/material.dart';

import 'package:flutter_application_1/pages/Login.dart';
import 'package:flutter_application_1/pages/root.dart';
import 'package:flutter_application_1/services/authentication.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants.dart';
import 'setProfile.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final _auth = Auth();

  void SignUpUser() async {
    bool response = (await _auth.Submit(
      email: emailController.text,
      password: passwordController.text,
      Loggedin: false,
    )) as bool;
    if (response) {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => Setprofile(),
      ));
    } else {}
  }

  @override
  void dispose() {
    // TODO: implement dispose
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(),
      body: Container(
        margin: EdgeInsets.only(right: 20, left: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Join Us Today !",
              style: GoogleFonts.poppins(
                  color: Colors.black,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Enter Email Address ",
              style: GoogleFonts.poppins(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w700),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Please enter the email address to create your account",
              style: GoogleFonts.poppins(
                  color: greyColor, fontSize: 18, fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              child: TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                    isDense: true, // Added this
                    contentPadding: EdgeInsets.all(23),
                    filled: true,
                    fillColor: Colors.grey[300],
                    hintText: 'Email Address',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(7.0),
                      borderSide: BorderSide.none,
                    ),
                  )),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              child: TextField(
                  obscureText: true,
                  controller: passwordController,
                  decoration: InputDecoration(
                    isDense: true, // Added this
                    contentPadding: EdgeInsets.all(23),
                    filled: true,
                    fillColor: Colors.grey[300],
                    hintText: 'password',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(7.0),
                      borderSide: BorderSide.none,
                    ),
                  )),
            ),
            Container(
              height: 60,
              margin: EdgeInsets.only(top: 20),
              width: double.infinity,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12), // <-- Radius
                    ),
                    backgroundColor: pinkColor,
                  ),
                  onPressed: () {
                    SignUpUser();
                  },
                  child: Text("Signup",
                      style: TextStyle(color: Colors.white, fontSize: 15))),
            ),
            Container(
              margin: EdgeInsets.only(top: 300),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an account?",
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Login()));
                    },
                    child: Text(
                      "Login here",
                      style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w800,
                          color: pinkColor),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
