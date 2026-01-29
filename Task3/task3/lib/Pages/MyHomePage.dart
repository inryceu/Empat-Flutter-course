import 'package:flutter/material.dart';
import 'package:task3/ui.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  final List<String> all = const [
    "covers/1.jpg",
    "covers/2.jpg",
    "covers/3.jpg",
    "covers/4.jpg",
    "covers/5.jpg",
    "covers/6.jpg",
    "covers/7.jpg",
    "covers/8.jpg",
    "covers/9.jpg",
  ];

  final List<String> animals = const [
    "covers/7.jpg",
    "covers/8.jpg",
    "covers/9.jpg",
  ];

  final List<String> different = const [
    "covers/1.jpg",
    "covers/2.jpg",
    "covers/3.jpg",
    "covers/4.jpg",
    "covers/5.jpg",
    "covers/6.jpg",
  ];

  List<Widget> get _pages => [
    MyGrid(images: all),
    MyGrid(images: animals),
    MyGrid(images: different),
  ];

  void _changeIndex(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(),
      drawer: MyAppDrawer(
        selectedIndex: _selectedIndex,
        onItemSelected: _changeIndex,
      ),
      body: MyBody(
        selectedIndex: _selectedIndex,
        pages: _pages,
        onIndexChanged: _changeIndex,
      ),
      bottomNavigationBar: MyBottomNavBar(
        selectedIndex: _selectedIndex,
        onItemSelected: _changeIndex,
      ),
    );
  }
}
