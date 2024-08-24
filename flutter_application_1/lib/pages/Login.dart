import 'package:flutter/material.dart';

import 'package:flutter_application_1/pages/root.dart';
import 'package:flutter_application_1/pages/signup.dart';
import 'package:flutter_application_1/services/authentication.dart';
import '../constants.dart';
import 'package:google_fonts/google_fonts.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _auth = Auth();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  void LoginUser() async {
    Future<bool> response = _auth.Login(
        email: _emailController.text, password: _passwordController.text);
    if (await response) {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => Root(),
      ));
    }
  }

  void dispose() {
    // TODO: implement dispose
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: EdgeInsets.only(right: 20, left: 20),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        // SizedBox(
        //   height: 10,
        // ),
        GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_ios,
            size: 40,
          ),
        ),
        // SizedBox(
        //   height: 40,
        // ),
        Text(
          "Welcome Back,Please login to your account",
          style: GoogleFonts.poppins(
              color: greyColor, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        // SizedBox(
        //   height: 30,
        // ),
        Text(
          "Email Address ",
          style: GoogleFonts.poppins(
              color: Colors.black, fontSize: 15, fontWeight: FontWeight.w700),
        ),
        TextField(
            controller: _emailController,
            decoration: InputDecoration(
              isDense: true, // Added this
              contentPadding: EdgeInsets.all(20),
              filled: true,
              fillColor: Colors.grey[300],
              hintText: 'Email Address',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(7.0),
                borderSide: BorderSide.none,
              ),
            )),
        // SizedBox(
        //   height: 30,
        // ),
        Text(
          " Passoword ",
          style: GoogleFonts.poppins(
              color: Colors.black, fontSize: 15, fontWeight: FontWeight.w700),
        ),
        TextField(
            controller: _passwordController,
            decoration: InputDecoration(
              isDense: true, // Added this
              contentPadding: EdgeInsets.all(20),
              filled: true,
              fillColor: Colors.grey[300],
              hintText: 'passwrod',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(7.0),
                borderSide: BorderSide.none,
              ),
            )),
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
                LoginUser();

                // Navigator.push(
                //     context, MaterialPageRoute(builder: (context) => Root()));
              },
              child: Text("Login",
                  style: TextStyle(color: Colors.white, fontSize: 15))),
        ),
        // SizedBox(
        //   height: 30,
        // ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Don't Have an account?",
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => SignUp()));
              },
              child: Text(
                "Signup here",
                style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w800,
                    color: pinkColor),
              ),
            )
          ],
        ),
      ]),
    ));
  }
}
