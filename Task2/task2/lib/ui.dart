import 'package:flutter/material.dart';
import 'styles.dart';

Widget NavBarMainIconButton({
  required double start,
  required double end,
  required IconData iconData,
}) => Padding(
  padding: EdgeInsetsGeometry.directional(start: start, end: end),
  child: Icon(iconData, color: Colors.white),
);

Widget NavBarSubIconButton({required IconData iconData}) => Padding(
  padding: EdgeInsets.symmetric(horizontal: 10.0),
  child: NavBarStyleWidget(
    child: IconButton(
      style: NavBarButtonStyle(),
      icon: Icon(
        iconData,
        color: Colors.white,
        fontWeight: FontWeight.w300,
        size: 24.0,
      ),
      onPressed: () {},
    ),
  ),
);

Widget NavBarTextButton({required String text}) => Padding(
  padding: EdgeInsets.symmetric(horizontal: 5.0),
  child: NavBarStyleWidget(
    child: TextButton(
      style: NavBarButtonStyle(),
      onPressed: () {},
      child: Text(
        text,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w500,
          fontSize: 16.0,
        ),
      ),
    ),
  ),
);
