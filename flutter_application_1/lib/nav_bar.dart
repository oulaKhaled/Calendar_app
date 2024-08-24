import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'dart:ffi';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/constants.dart';

int number = 0;

class BottomNavBar extends StatefulWidget {
  BottomNavBar({
    super.key,
  });

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    return Container(
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
                      number = 1;
                    });
                  },
                  icon: Icon(
                    Icons.home,
                    size: 35,
                    color: number == 1 ? pinkColor : greyColor,
                  ),
                ),
                // ignore: prefer_interpolation_to_compose_strings
                Text("Home ${number}")
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
                    Icons.calendar_month,
                    size: 35,
                    color: number == 2 ? pinkColor : greyColor,
                  ),
                ),
                Text("Calender")
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
                    Icons.watch_later_outlined,
                    size: 35,
                    color: number == 3 ? pinkColor : greyColor,
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
                      number = 4;
                    });
                  },
                  icon: Icon(
                    Icons.person,
                    size: 35,
                    color: number == 4 ? pinkColor : greyColor,
                  ),
                ),
                Text("Profile")
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class IconButton2 extends StatefulWidget {
  final mynumber;
  final icon;
  final title;

  const IconButton2({
    super.key,
    this.mynumber,
    this.icon,
    this.title,
  });

  @override
  State<IconButton2> createState() => _IconButton2State();
}

class _IconButton2State extends State<IconButton2> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          IconButton(
            onPressed: () {
              setState(() {
                number = widget.mynumber;
              });
            },
            icon: Icon(
              widget.icon,
              size: 35,
              color: number == widget.mynumber ? pinkColor : greyColor,
            ),
          ),
          Text(widget.title)
        ],
      ),
    );
  }
}
