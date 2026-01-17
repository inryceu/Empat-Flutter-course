import 'package:flutter/material.dart';

Widget NavBarStyleWidget({required Widget child, VoidCallback? onPressed}) =>
    Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: Colors.grey[800],
        shape: BoxShape.rectangle,
      ),
      child: child,
    );

ButtonStyle NavBarButtonStyle() => TextButton.styleFrom(
  padding: EdgeInsets.all(5.0),
  minimumSize: Size.zero,
  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
);

Widget NavBarMainIconButton({
  required double start,
  required double end,
  required IconData iconData,
}) => Padding(
  padding: EdgeInsetsGeometry.directional(start: start, end: end),
  child: Icon(iconData, color: Colors.white),
);

Widget NavBarSubIconButton({required IconData iconData}) => NavBarStyleWidget(
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
);

Widget NavBarTextButton({required String text}) => NavBarStyleWidget(
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
);
