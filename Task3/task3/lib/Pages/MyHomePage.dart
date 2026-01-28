import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
  ];

  final List<String> animals = const ["covers/7.jpg", "covers/8.jpg"];

  final List<String> different = const [
    "covers/1.jpg",
    "covers/2.jpg",
    "covers/3.jpg",
    "covers/4.jpg",
    "covers/5.jpg",
    "covers/6.jpg",
  ];

  List<Widget> get _pages => [
    MyBody(images: all),
    MyBody(images: animals),
    MyBody(images: different),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.blueGrey),
              child: Text(
                "Menu",
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            ListTile(
              leading: const Icon(FontAwesomeIcons.pentagon),
              title: const Text("All"),
              onTap: () {
                setState(() => _selectedIndex = 0);
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(FontAwesomeIcons.circleDot),
              title: const Text("Animals"),
              onTap: () {
                setState(() => _selectedIndex = 1);
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(FontAwesomeIcons.square),
              title: const Text("Different"),
              onTap: () {
                setState(() => _selectedIndex = 2);
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: _pages[_selectedIndex],
    );
  }
}
