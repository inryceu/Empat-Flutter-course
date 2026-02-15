import 'package:flutter/material.dart';
import '../Components/app_bar.dart';
import '../Components/body.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: const MyAppBar(), body: const MyBody());
  }
}
