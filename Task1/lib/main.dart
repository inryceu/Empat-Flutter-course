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

Widget MyTextField({
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

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final String defaultFirstName = 'Pavlo';
  final String defaultLastName = 'Maluiev';
  late Student student;

  @override
  void initState() {
    super.initState();
    student = Student(defaultFirstName, defaultLastName);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'First task. Maluiev Pavlo',
            style: TextStyle(fontSize: 20),
          ),
          centerTitle: true,
          backgroundColor: Colors.indigo,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              student.buildTextWidget(),
              MyTextField(
                hintText: "Enter your first name",
                onChanged: (value) {
                  setState(() {
                    (value != '')
                        ? student.firstName(value)
                        : student.firstName(defaultFirstName);
                  });
                },
              ),
              MyTextField(
                hintText: "Enter your last name",
                onChanged: (value) {
                  setState(() {
                    (value != '')
                        ? student.lastName(value)
                        : student.lastName(defaultLastName);
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void main() => runApp(MyApp());
