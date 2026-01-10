import 'package:flutter/material.dart';

import '../ui.dart';
import '../domain.dart';
import '../utils.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with UIComponent {
  final String defaultFirstName = 'Pavlo';
  final String defaultLastName = 'Maluiev';

  String? _firstName;
  String? _lastName;
  String? _fullName;

  late Student student;

  @override
  void initState() {
    super.initState();
    student = Student(defaultFirstName, defaultLastName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            myTextField(
              hintText: "Enter your full name",
              onChanged: (value) {
                setState(() {
                  (value != '')
                      ? _fullName = value
                      : _fullName = '$defaultFirstName $defaultLastName';
                });
              },
            ),
            myButton(
              text: 'Submit',
              onPressed: () {
                _firstName ??= defaultFirstName;
                _lastName ??= defaultLastName;

                var validate = validateFactory(isFullName: false);
                var responseFirstName = validate(_firstName!);
                var responseLastName = validate(_lastName!);

                if (!responseFirstName["isValid"]) {
                  myExeptionDialog(
                    context: context,
                    message: "${responseFirstName["message"]} in First Name",
                  );
                }
                if (!responseLastName["isValid"]) {
                  myExeptionDialog(
                    context: context,
                    message: "${responseLastName["message"]} in Last Name",
                  );
                }

                setState(() {
                  student.firstName =
                      ((_firstName!.isEmpty ||
                          responseFirstName["isValid"] == false)
                      ? defaultFirstName
                      : _firstName)!;

                  student.lastName =
                      ((_lastName!.isEmpty ||
                          responseLastName["isValid"] == false)
                      ? defaultLastName
                      : _lastName)!;
                });
              },
            ),
            myButton(
              text: "Submit with full name",
              onPressed: () {
                _fullName ??= '$defaultFirstName $defaultLastName';

                var validate = validateFactory(isFullName: true);
                var responseFullName = validate(_fullName!);

                if (!responseFullName["isValid"]) {
                  myExeptionDialog(
                    context: context,
                    message: responseFullName["message"],
                  );
                }

                setState(() {
                  student = Student.fromFullName(_fullName!);
                });
              },
            ),
            myButton(
              text: 'Reset to default',
              onPressed: () {
                setState(() {
                  _firstName ??= defaultFirstName;
                  _lastName ??= defaultLastName;
                  _fullName ??= '$defaultFirstName $defaultLastName';
                  student.firstName = defaultFirstName;
                  student.lastName = defaultLastName;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
