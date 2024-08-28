import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;

import 'package:flutter_application_1/constants.dart';

import 'package:flutter_application_1/pages/signup.dart';
import 'package:google_fonts/google_fonts.dart';
import 'pages/Login.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp(
      options: FirebaseOptions(
          apiKey: "AIzaSyBkmn7AUOofYecAPOmhKiOXD9Y-Mlunu74",
          appId: "1:233033606415:android:3700b9516c4c9fb61b8a7a",
          messagingSenderId: "233033606415",
          projectId: "calenderapp-3d813"));
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: initateScreen(),
    );
  }
}

class initateScreen extends StatelessWidget {
  const initateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Directionality(
        textDirection: TextDirection.ltr,
        child: Container(
            decoration: BoxDecoration(color: pinkColor),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Stack(children: [
              Positioned(
                // right: 2,
                left: 80,
                bottom: 290,
                child: SizedBox(
                  height: 800,
                  width: 500,
                  child: Container(
                      decoration: BoxDecoration(
                    color: pinkColor2,
                    shape: BoxShape.circle,
                  )),
                ),
              ),
              Positioned(
                right: 100,
                bottom: 190,
                child: SizedBox(
                  height: 900,
                  width: 550,
                  child: Container(
                    decoration: BoxDecoration(
                      color: pinkColor2,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    width: 500,
                    height: 340,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 15, right: 15),
                          child: Text(
                            "Let's Get Started ",
                            style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontSize: 55,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 20, top: 2),
                          child: Text("Manage meetings with ease",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 17,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w600)),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                            width: double.infinity, // <-- match_parent
                            height: 55, // <-- match-parent
                            child: Padding(
                              padding: EdgeInsets.only(left: 15, right: 15),
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                          10), // <-- Radius
                                    ),
                                  ),
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Login()));
                                  },
                                  child: Text(
                                    "Login ",
                                    style: TextStyle(
                                        color: pinkColor, fontSize: 20),
                                  )),
                            )),
                        SizedBox(
                          height: 15,
                        ),
                        SizedBox(
                            width: double.infinity, // <-- match_parent
                            height: 60, // <-- match-parent
                            child: Padding(
                              padding: EdgeInsets.only(
                                  left: 15, right: 15, bottom: 5),
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                          10), // <-- Radius
                                    ),
                                    backgroundColor: pinkColor,
                                    side: BorderSide(
                                      width: 2,
                                      color: Colors.white,
                                    ),
                                  ),
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => SignUp()));
                                  },
                                  child: Text("Sign Up",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 20))),
                            )),
                      ],
                    ),
                  )
                ],
              )
            ])),
      ),
    );
  }
}
