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
