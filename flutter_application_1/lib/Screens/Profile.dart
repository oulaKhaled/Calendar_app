import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/constants.dart';
import 'package:flutter_application_1/main.dart';
import 'package:flutter_application_1/services/authentication.dart';
import 'package:google_fonts/google_fonts.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 400,
          width: double.infinity,
          margin: EdgeInsets.only(top: 40),
          child: Column(
            children: [
              Container(
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 40, top: 30),
                      child: CircleAvatar(
                        radius: 45,
                        child: CircleAvatar(
                            radius: 60,
                            backgroundImage: NetworkImage(
                              'https://images.pexels.com/photos/3680219/pexels-photo-3680219.jpeg',
                            )),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      children: [
                        Text(
                          "Hi,Valentine",
                          style: GoogleFonts.poppins(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.location_on,
                              size: 20,
                            ),
                            Text(
                              "Boston",
                              style: GoogleFonts.poppins(fontSize: 12),
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: Text(
                          "Accounts",
                          style:
                              GoogleFonts.poppins(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 20),
                        child: Text("Manage",
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.bold)),
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 30, left: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("google Account",
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.bold)),
                        Text("Facebook Account",
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.bold)),
                        Text("outlook Account",
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.bold)),
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 250, left: 30),
          width: double.infinity,
          child: GestureDetector(
            onTap: () {
              Auth().Logout();
            },
            child: GestureDetector(
              onTap: () {
                Auth().Logout();
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => MyApp(),
                ));
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(
                    Icons.logout,
                    size: 30,
                    color: pinkColor,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    "Logout",
                    style: GoogleFonts.poppins(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: pinkColor),
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
