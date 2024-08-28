import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/Screens/home.dart';
import 'package:flutter_application_1/constants.dart';
import 'package:flutter_application_1/pages/root.dart';
import 'package:flutter_application_1/services/authentication.dart';
import 'package:google_fonts/google_fonts.dart';

class Setprofile extends StatefulWidget {
  const Setprofile({super.key});

  @override
  State<Setprofile> createState() => _SetprofileState();
}

class _SetprofileState extends State<Setprofile> {
  final _nameController = TextEditingController();
  final _locationController = TextEditingController();

  EditUser() {
    Auth().EditUser(
        name: _nameController.text, location: _locationController.text);
    Navigator.of(context).pushReplacement(MaterialPageRoute(
      builder: (context) => Home(),
    ));
  }

  @override
  void dispose() {
    _nameController.dispose();
    _locationController.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(),
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Text(
            "Welcome",
            style: GoogleFonts.poppins(
                fontSize: 25, fontWeight: FontWeight.w800, color: Colors.black),
          ),
          Text(
            "Set up Your Profile Now !",
            style: GoogleFonts.poppins(
                fontSize: 20, fontWeight: FontWeight.w800, color: greyColor),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            width: double.infinity,
            height: 300,
            margin: EdgeInsets.all(20),
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
                border: Border.all(color: greyColor),
                borderRadius: BorderRadius.circular(20)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Name",
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.bold, fontSize: 20)),
                TextField(
                    controller: _nameController,
                    decoration: InputDecoration(
                      isDense: true, // Added this
                      contentPadding: EdgeInsets.all(23),
                      filled: true,
                      fillColor: Colors.grey[300],
                      hintText: "Enter your name",
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(7.0),
                      ),
                    )),
                SizedBox(
                  height: 30,
                ),
                Text("Location",
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.bold, fontSize: 20)),
                TextField(
                    controller: _locationController,
                    decoration: InputDecoration(
                      isDense: true, // Added this
                      contentPadding: EdgeInsets.all(23),
                      filled: true,
                      fillColor: Colors.grey[300],
                      hintText: "Enter your location",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(7.0),
                          borderSide: BorderSide.none),
                    )),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
          Container(
            height: 60,
            margin: EdgeInsets.only(top: 20),
            padding: EdgeInsets.only(left: 50, right: 50),
            width: double.infinity,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12), // <-- Radius
                  ),
                  backgroundColor: pinkColor,
                ),
                onPressed: () {
                  EditUser();
                },
                child: Text("Start Now!",
                    style: TextStyle(color: Colors.white, fontSize: 20))),
          ),
          // Container(
          //   width: double.infinity,
          //   height: 174,
          // ),
        ],
      ),
    );
  }
}
