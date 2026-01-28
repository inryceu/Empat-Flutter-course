import 'package:flutter/material.dart';
import 'package:task3/ui.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<StatefulWidget> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(),
      body: const MyBody(),
      drawer: ListView(
        children: [
          FloatingActionButton(
            onPressed: () {
              print("hello");
            },
          ),
        ],
      ),
      bottomNavigationBar: FloatingActionButton(
        onPressed: () {
          print("hello");
        },
      ),
    );
  }
}
