import 'package:flutter/material.dart';
import 'ui.dart';
import 'domain.dart';
import 'utils.dart';

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
                  if (_firstName.isEmpty) {
                    _firstName = defaultFirstName;
                  }
                  if (_lastName.isEmpty) {
                    _lastName = defaultLastName;
                  }

                  var resultFirstName = validate(_firstName);
                  var resultLastName = validate(_lastName);

                  if (resultFirstName != "OK") {
                    myExeptionDialog(
                      context: context,
                      message: "$resultFirstName in First Name",
                    );
                  }
                  if (resultLastName != "OK") {
                    myExeptionDialog(
                      context: context,
                      message: "$resultLastName in Last Name",
                    );
                  }

                  setState(() {
                    student.firstName(
                      (_firstName.isEmpty || resultFirstName != "OK")
                          ? defaultFirstName
                          : _firstName,
                    );
                    student.lastName(
                      (_lastName.isEmpty || resultLastName != "OK")
                          ? defaultLastName
                          : _lastName,
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

void main() {
  runApp(const MaterialApp(home: MyApp()));
}
