import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants.dart';
import 'package:flutter_application_1/controllers/event_controller.dart';
import 'package:flutter_application_1/models/models.dart';
import 'package:flutter_application_1/services/authentication.dart';
import 'package:flutter_application_1/utils.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  Future<List<Event>> _data() async {
    return await EventController().GetEventsController();
  }

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
                  "Hello, ",
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
                SizedBox(
                  height: 10,
                ),
                Container(
                    margin: EdgeInsets.all(10),
                    width: double.infinity,
                    height: 100,
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
                Center(
                  child: Stack(
                    children: [
                      FutureBuilder<List<Event>>(
                          future: _data(),
                          builder: (context, snapshot) {
                            return Column(
                                // Use Column, ListView, or another widget to display the list of widgets
                                children: snapshot.data!.map((event) {
                              return Container(
                                  margin: EdgeInsets.all(20),
                                  width: double.infinity,
                                  height: 200,
                                  decoration: BoxDecoration(
                                      // color: Color.fromARGB(255, 250, 197, 216),
                                      color: Color.fromARGB(255, 205, 221, 253),
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Container(
                                    margin: EdgeInsets.all(10),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          event.title,
                                          style: GoogleFonts.poppins(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          event.description,
                                          style: GoogleFonts.poppins(
                                              color: greyColor,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Icon(
                                              Icons.date_range,
                                              size: 30,
                                            ),
                                            Text(
                                              Utils.toDateTime(event.to),
                                              style: GoogleFonts.poppins(
                                                  color: greyColor,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 20),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Icon(
                                              Icons.date_range,
                                              size: 30,
                                            ),
                                            Text(
                                              Utils.toDateTime(event.from),
                                              style: GoogleFonts.poppins(
                                                  color: greyColor,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 20),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  )); // Return a Text widget for each event's title
                            }).toList());
                          })
                      // // Positioned(
                      // ListTile(title: Text("${snapshot}"))
                      //     right: 45,
                      //     child: ClipPath(
                      //       clipper: CustomClipPath(),
                      //       child: Container(
                      //         margin: EdgeInsets.all(20),
                      //         width: 80,
                      //         height: 200,
                      //         decoration: BoxDecoration(
                      //             color: pinkColor2,
                      //             borderRadius: BorderRadius.circular(10)),
                      //       ),
                      //     ))
                      // Container(
                      //         margin: EdgeInsets.all(20),
                      //         width: double.infinity,
                      //         height: 200,
                      //         decoration: BoxDecoration(
                      //             color: Color.fromARGB(255, 250, 197, 216),
                      //             borderRadius: BorderRadius.circular(10)),
                      //         child: Text("${snapshot.data}"),
                      //       );),)
                      //     })
                    ],
                  ),
                ),

                // Container(
                //   margin: EdgeInsets.all(20),
                //   width: double.infinity,
                //   height: 200,
                //   decoration: BoxDecoration(
                //       color: Colors.blue[50],
                //       borderRadius: BorderRadius.circular(10)),
                // ),
                // Container(
                //   margin: EdgeInsets.all(20),
                //   width: double.infinity,
                //   height: 200,
                //   decoration: BoxDecoration(
                //       color: Colors.blue[50],
                //       borderRadius: BorderRadius.circular(10)),
                // ),
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
