import 'package:flutter/material.dart';
import 'ui.dart';
import 'domain.dart';

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
          title: Text(
            'First task. Maluiev Pavlo',
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
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
              myButton(
                text: 'Submit',
                onPressed: () {
                  setState(() {
                    student.firstName(
                      _firstName.isEmpty ? defaultFirstName : _firstName,
                    );
                    student.lastName(
                      _lastName.isEmpty ? defaultLastName : _lastName,
                    );
                  });
                },
              ),
              myButton(
                text: 'Reset to default',
                onPressed: () {
                  setState(() {
                    _firstName = defaultFirstName;
                    _lastName = defaultLastName;
                    student.firstName(defaultFirstName);
                    student.lastName(defaultLastName);
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
