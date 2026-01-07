import 'package:flutter/material.dart';

class Student {
  String _firstName;
  String _lastName;

  Student(this._firstName, this._lastName);

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

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('First task. Maluiev Pavlo')),
        body: Center(child: Student('Maluiev', 'Pavlo').buildTextWidget()),
      ),
    ),
  );
}
