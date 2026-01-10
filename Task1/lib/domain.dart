import 'package:flutter/material.dart';

class Student {
  String _firstName;
  String _lastName;

  Student(String firstName, String lastName)
    : _firstName = firstName,
      _lastName = lastName;
  factory Student.fromFullName(String fullName) {
    List<String> parts = fullName.split(' ');
    return Student(parts[0], parts[1]);
  }

  set firstName(String firstName) {
    _firstName = firstName;
  }

  String get firstName => _firstName;

  set lastName(String lastName) {
    _lastName = lastName;
  }

  String get lastName => _lastName;

  Widget buildTextWidget() => Text(
    '$_firstName $_lastName',
    style: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.bold,
      color: Colors.blueGrey,
    ),
  );
}
