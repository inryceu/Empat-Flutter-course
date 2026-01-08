import 'package:flutter/material.dart';

class Student {
  String _firstName;
  String _lastName;

  Student(this._firstName, this._lastName);

  void firstName(String firstName) {
    _firstName = firstName;
  }

  void lastName(String lastName) {
    _lastName = lastName;
  }

  Widget buildTextWidget() => Text(
    '$_firstName $_lastName',
    style: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.bold,
      color: Colors.blueGrey,
    ),
  );
}
