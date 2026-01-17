import 'package:flutter/material.dart';
import '../components.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      body: MyBody(),
      bottomNavigationBar: MyBottomAppBar(),
    );
  }
}
