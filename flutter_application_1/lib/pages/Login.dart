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
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _auth = Auth();
  void dispose() {
    // TODO: implement dispose
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void LoginUser() async {
    Future<bool> response = _auth.Submit(
        Loggedin: true,
        email: _emailController.text,
        password: _passwordController.text);
    if (await response) {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => Root(),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(),
        body: Padding(
          padding: EdgeInsets.only(right: 20, left: 20, top: 40),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              "Welcome Back,",
              style: GoogleFonts.poppins(
                  color: Colors.black,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              "Please login to your account",
              style: GoogleFonts.poppins(
                  color: greyColor, fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              "Email Address ",
              style: GoogleFonts.poppins(
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.w700),
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
            SizedBox(
              height: 30,
            ),
            Text(
              " Passoword ",
              style: GoogleFonts.poppins(
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.w700),
            ),
            TextField(
                obscureText: true,
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
            SizedBox(
              height: 40,
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
              height: 20,
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
                      onPressed: () async {
                        Future<bool?> response = _auth.LoginWithGoogle();
                        if (response == true) {
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(builder: (context) => Root()));
                        }
                      },
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
            // SizedBox(
            //   height: 30,
            // ),
            Align(
              child: Container(
                width: double.infinity,
                height: 100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
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
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => SignUp()));
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
              ),
            ),
          ]),
        ));
  }
}
