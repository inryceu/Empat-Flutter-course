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

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final Student student = Student('Maluiev', 'Pavlo');

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
              SizedBox(
                height: 60,
                width: 250,
                child: TextField(
                  decoration: const InputDecoration(
                    hintText: "Enter your first name",
                    contentPadding: EdgeInsets.symmetric(horizontal: 10),
                  ),
                  onChanged: (value) {
                    setState(() {
                      student.firstName(value);
                    });
                  },
                ),
              ),
              SizedBox(
                height: 60,
                width: 250,
                child: TextField(
                  decoration: const InputDecoration(
                    hintText: "Enter your last name",
                    contentPadding: EdgeInsets.symmetric(horizontal: 10),
                  ),
                  onChanged: (value) {
                    setState(() {
                      student.lastName(value);
                    });
                  },
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
