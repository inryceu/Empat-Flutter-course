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

class MyApp extends StatelessWidget {
  final student = Student('Maluiev', 'Pavlo');

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'First task. Maluiev Pavlo',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.normal,
              color: Colors.white,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.indigo,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(child: student.buildTextWidget()),
              Center(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Enter your first name",
                    fillColor: Colors.cyan,
                  ),
                  onChanged: (String value) => student.firstName(value),
                ),
              ),
              Center(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Enter your last name",
                    fillColor: Colors.cyan,
                  ),
                  onChanged: (String value) => student.lastName(value),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void main() => runApp(MyApp());
