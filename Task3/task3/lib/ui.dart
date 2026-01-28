import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 80,
      backgroundColor: Colors.blueGrey,
      centerTitle: true,
      title: Text(
        "Photo Gallery",
        style: TextStyle(
          fontFamily: "Roboto",
          fontSize: 24,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class MyBody extends StatelessWidget {
  const MyBody({super.key});

  final List<Image> list = const [
    Image(image: AssetImage("covers/1.jpg")),
    Image(image: AssetImage("covers/2.jpg")),
    Image(image: AssetImage("covers/3.jpg")),
    Image(image: AssetImage("covers/4.jpg")),
    Image(image: AssetImage("covers/5.jpg")),
    Image(image: AssetImage("covers/6.jpg")),
    Image(image: AssetImage("covers/7.jpg")),
    Image(image: AssetImage("covers/8.jpg")),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: GridView.count(
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        children: list.asMap().entries.map((entry) {
          final index = entry.key;
          final img = entry.value;

          return Hero(tag: 'photo_$index', child: img);
        }).toList(),
      ),
    );
  }
}
