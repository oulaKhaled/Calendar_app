import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(children: [
        Container(
            margin: EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(
                        Icons.align_horizontal_left_sharp,
                        size: 30,
                      ),
                      Icon(
                        Icons.notifications,
                        size: 30,
                      )
                    ],
                  ),
                ),
                Text(
                  "Hello, User",
                  style: GoogleFonts.poppins(
                      fontSize: 30, fontWeight: FontWeight.w600),
                ),
                Row(
                  children: [
                    Text("Boston",
                        style: GoogleFonts.poppins(
                            fontSize: 20, fontWeight: FontWeight.w500)),
                    Icon(Icons.location_on)
                  ],
                ),
                Center(
                  child: Stack(
                    children: [
                      Container(
                          margin: EdgeInsets.all(20),
                          width: double.infinity,
                          height: 200,
                          decoration: BoxDecoration(
                              color: pinkColor,
                              borderRadius: BorderRadius.circular(10)),
                          child: Padding(
                            padding: EdgeInsets.all(10),
                            child: Text(
                              "You have pretty Busy Week ",
                              style: GoogleFonts.poppins(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 24),
                            ),
                          )),
                      Positioned(
                          right: 45,
                          child: ClipPath(
                            clipper: CustomClipPath(),
                            child: Container(
                              margin: EdgeInsets.all(20),
                              width: 80,
                              height: 200,
                              decoration: BoxDecoration(
                                  color: pinkColor2,
                                  borderRadius: BorderRadius.circular(10)),
                            ),
                          ))
                    ],
                  ),
                ),
                Text(
                  "Upcoming Events",
                  style: GoogleFonts.poppins(
                      fontSize: 25, fontWeight: FontWeight.w600),
                ),
                Text("This Week",
                    style: GoogleFonts.poppins(
                        color: greyColor,
                        fontSize: 15,
                        fontWeight: FontWeight.w500)),
                Container(
                  margin: EdgeInsets.all(20),
                  width: double.infinity,
                  height: 200,
                  decoration: BoxDecoration(
                      color: Colors.blue[50],
                      borderRadius: BorderRadius.circular(10)),
                ),
                Container(
                  margin: EdgeInsets.all(20),
                  width: double.infinity,
                  height: 200,
                  decoration: BoxDecoration(
                      color: Colors.blue[50],
                      borderRadius: BorderRadius.circular(10)),
                ),
                Container(
                  margin: EdgeInsets.all(20),
                  width: double.infinity,
                  height: 200,
                  decoration: BoxDecoration(
                      color: Colors.blue[50],
                      borderRadius: BorderRadius.circular(10)),
                ),
              ],
            )),
      ]),
    );
  }
}

class CustomClipPath extends CustomClipper<Path> {
  var path = Path();
  @override
  getClip(Size size) {
    // path.lineTo(0, size.width);
    // path.lineTo(size.width, size.height);

    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height);

    return path;
    throw UnimplementedError();
  }

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) {
    return true;
    //throw UnimplementedError();
  }
}
