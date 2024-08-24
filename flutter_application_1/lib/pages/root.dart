import 'package:flutter/material.dart';
import 'package:flutter_application_1/Screens/Profile.dart';
import 'package:flutter_application_1/Screens/calendar.dart';
import 'package:flutter_application_1/Screens/clock.dart';
import 'package:flutter_application_1/Screens/home.dart';
import 'package:flutter_application_1/nav_bar.dart';
import 'package:flutter_application_1/constants.dart';
import 'dart:ffi';

int mynumber = 1;

class Root extends StatefulWidget {
  Root({super.key});

  @override
  State<Root> createState() => _RootState();
}

class _RootState extends State<Root> {
  @override
  final Screens = [Home(), Calendar(), Clock(), Profile()];

  Widget build(BuildContext context) {
    return Scaffold(
        body: Screens[number],
        bottomNavigationBar: Container(
          width: 100,
          height: 80,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                child: Column(
                  children: [
                    IconButton(
                      onPressed: () {
                        setState(() {
                          number = 0;
                        });
                      },
                      icon: Icon(
                        Icons.home,
                        size: 35,
                        color: number == 0 ? pinkColor : greyColor,
                      ),
                    ),
                    Text("Home ")
                    // ignore: prefer_interpolation_to_compose_strings
                  ],
                ),
              ),
              Container(
                child: Column(
                  children: [
                    IconButton(
                      onPressed: () {
                        setState(() {
                          number = 1;
                        });
                      },
                      icon: Icon(
                        Icons.calendar_month,
                        size: 35,
                        color: number == 1 ? pinkColor : greyColor,
                      ),
                    ),
                    Text("Calendar")
                  ],
                ),
              ),
              Container(
                child: Column(
                  children: [
                    IconButton(
                      onPressed: () {
                        setState(() {
                          number = 2;
                        });
                      },
                      icon: Icon(
                        Icons.watch_later_outlined,
                        size: 35,
                        color: number == 2 ? pinkColor : greyColor,
                      ),
                    ),
                    Text("Clock")
                  ],
                ),
              ),
              Container(
                child: Column(
                  children: [
                    IconButton(
                      onPressed: () {
                        setState(() {
                          number = 3;
                        });
                      },
                      icon: Icon(
                        Icons.person,
                        size: 35,
                        color: number == 3 ? pinkColor : greyColor,
                      ),
                    ),
                    Text("Profile")
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}

// class BottomNavBar2 extends StatefulWidget {
//   const BottomNavBar2({
//     super.key,
//   });

//   @override
//   State<BottomNavBar2> createState() => _BottomNavBar2State();
// }

// class _BottomNavBar2State extends State<BottomNavBar2> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 100,
//       height: 80,
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceAround,
//         children: [
//           Container(
//             child: Column(
//               children: [
//                 IconButton(
//                   onPressed: () {
//                     setState(() {
//                       number = 0;
//                     });
//                   },
//                   icon: Icon(
//                     Icons.home,
//                     size: 35,
//                     color: number == 0 ? pinkColor : greyColor,
//                   ),
//                 ),
//                 // ignore: prefer_interpolation_to_compose_strings
//                 Text("Home ${number}")
//               ],
//             ),
//           ),
//           Container(
//             child: Column(
//               children: [
//                 IconButton(
//                   onPressed: () {
//                     setState(() {
//                       number = 1;
//                     });
//                   },
//                   icon: Icon(
//                     Icons.calendar_month,
//                     size: 35,
//                     color: number == 1 ? pinkColor : greyColor,
//                   ),
//                 ),
//                 Text("Calender")
//               ],
//             ),
//           ),
//           Container(
//             child: Column(
//               children: [
//                 IconButton(
//                   onPressed: () {
//                     setState(() {
//                       number = 2;
//                     });
//                   },
//                   icon: Icon(
//                     Icons.watch_later_outlined,
//                     size: 35,
//                     color: number == 2 ? pinkColor : greyColor,
//                   ),
//                 ),
//                 Text("Clock")
//               ],
//             ),
//           ),
//           Container(
//             child: Column(
//               children: [
//                 IconButton(
//                   onPressed: () {
//                     setState(() {
//                       number = 3;
//                     });
//                   },
//                   icon: Icon(
//                     Icons.person,
//                     size: 35,
//                     color: number == 3 ? pinkColor : greyColor,
//                   ),
//                 ),
//                 Text("Profile")
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   int GetNumber() {
//     return number;
//   }
// }
