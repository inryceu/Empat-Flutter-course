import 'package:flutter/material.dart';
import 'Pages/HomePage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'YouTube Clone',
      theme: ThemeData(
        colorScheme: ColorScheme(
          surface: Colors.black,
          brightness: Brightness.dark,
          primary: Colors.red,
          onPrimary: Colors.white,
          secondary: Colors.redAccent,
          onSecondary: Colors.white,
          error: Colors.red,
          onError: Colors.white,
          onSurface: Colors.white,
        ),
      ),
      home: HomePage(),
    );
  }
}
