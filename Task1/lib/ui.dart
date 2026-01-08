import 'package:flutter/material.dart';

Widget myTextField({
  String hintText = "Enter text",
  Function(String)? onChanged,
}) => SizedBox(
  height: 60,
  width: 250,
  child: TextField(
    decoration: InputDecoration(
      hintText: hintText,
      contentPadding: EdgeInsets.symmetric(horizontal: 10),
    ),
    onChanged: onChanged,
  ),
);

Widget myButton({required String text, required VoidCallback onPressed}) =>
    SizedBox(
      height: 40,
      width: 200,
      child: TextButton(
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(
            fontSize: 20,
            color: Colors.indigo,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
