import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/Login.dart';
import 'package:flutter_application_1/pages/root.dart';
import 'package:flutter_application_1/services/authentication.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final _auth = Auth();
  @override
  void dispose() {
    // TODO: implement dispose
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void SignUpUser() async {
    bool response = (await _auth.signup(
        email: emailController.text,
        password: passwordController.text)) as bool;
    if (response) {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => Root(),
      ));
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(right: 20, left: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 10,
            ),
            Container(
              margin: EdgeInsets.only(bottom: 40, top: 20),
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(
                  Icons.arrow_back_ios,
                  size: 40,
                ),
              ),
            ),
            Text(
              "Enter Email Address ",
              style: GoogleFonts.poppins(
                  color: Colors.black,
                  fontSize: 20,
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
            SizedBox(
              height: 30,
            ),
            Center(
              child: Text(
                "OR",
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.grey[600],
                    fontWeight: FontWeight.w700),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                    height: 80,
                    width: 80,
                    child: ElevatedButton(
                      child: Container(
                        child: Image.asset(
                          "assets/google_logo2.png",
                          fit: BoxFit.cover,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                          // <-- Radius
                        ),
                        side: BorderSide(
                          width: 2,
                          color: pinkColor,
                        ),
                      ),
                      onPressed: () {},
                    )),
                SizedBox(
                  width: 20,
                ),
                SizedBox(
                  height: 80,
                  width: 80,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12), // <-- Radius
                        ),
                        side: BorderSide(
                          width: 2,
                          color: pinkColor,
                        ),
                      ),
                      onPressed: () {},
                      child: Container(
                        child: Image.asset(
                          "assets/facebook_logo2.png",
                          width: 70,
                          height: 70,
                        ),
                      )),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: 70),
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
