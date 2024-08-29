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

Future _getUserInfo() async {
  final data = await Auth().getCurrentUserInfo();
  print("THİS İS UUUUSERRR IFNFFOOORMMATİOON : ${data["name"]}");
  return data;
}

class _ProfileState extends State<Profile> {
  @override
  void initState() {
    _getUserInfo();
    // TODO: implement initState
    super.initState();
  }

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
                              'https://static.vecteezy.com/system/resources/previews/009/292/244/original/default-avatar-icon-of-social-media-user-vector.jpg',
                            )),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    FutureBuilder(
                      future: _getUserInfo(),
                      builder: (context, snapshot) {
                        return Column(
                          children: [
                            Text(
                              "Hi,${snapshot.data["name"]}",
                              style: GoogleFonts.poppins(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Icon(
                                  Icons.location_on,
                                  size: 20,
                                ),
                                Text(
                                  "${snapshot.data["location"]}",
                                  style: GoogleFonts.poppins(fontSize: 15),
                                ),
                              ],
                            )
                          ],
                        );
                      },
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
                                fontWeight: FontWeight.bold, color: pinkColor)),
                      ),
                    ],
                  ),
                  FutureBuilder(
                      future: _getUserInfo(),
                      builder: (context, snapshot) {
                        return Container(
                          margin: EdgeInsets.only(top: 30, left: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Icon(Icons.email_sharp),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text("${snapshot.data["email"]}",
                                      style: GoogleFonts.poppins(
                                          fontWeight: FontWeight.bold)),
                                ],
                              ),
                            ],
                          ),
                        );
                      })
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
