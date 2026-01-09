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
      width: 250,
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

Future myExeptionDialog({
  required BuildContext context,
  required String message,
}) => showDialog(
  context: context,
  builder: (BuildContext context) {
    return AlertDialog(
      title: Text('Error!'),
      content: Text(
        message,
        style: TextStyle(
          fontSize: 20,
          color: Colors.red,
          fontWeight: FontWeight.bold,
        ),
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('Close'),
        ),
      ],
    );
  },
);
