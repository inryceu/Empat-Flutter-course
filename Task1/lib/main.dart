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

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final String defaultFirstName = 'Pavlo';
  final String defaultLastName = 'Maluiev';

  var _firstName = '';
  var _lastName = '';

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
              SizedBox(
                height: 60,
                width: 250,
                child: Center(child: student.buildTextWidget()),
              ),
              myTextField(
                hintText: "Enter your first name",
                onChanged: (value) {
                  setState(() {
                    (value != '')
                        ? _firstName = value
                        : _firstName = defaultFirstName;
                  });
                },
              ),
              myTextField(
                hintText: "Enter your last name",
                onChanged: (value) {
                  setState(() {
                    (value != '')
                        ? _lastName = value
                        : _lastName = defaultLastName;
                  });
                },
              ),
              SizedBox(
                height: 40,
                width: 200,
                child: TextButton(
                  onPressed: () {
                    setState(() {
                      student.firstName(_firstName);
                      student.lastName(_lastName);
                    });
                  },
                  child: Text(
                    'Submit',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.indigo,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 40,
                width: 200,
                child: TextButton(
                  onPressed: () {
                    setState(() {
                      student.firstName(defaultFirstName);
                      student.lastName(defaultLastName);
                    });
                  },
                  child: Text(
                    'Reset to Default',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.indigo,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
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
