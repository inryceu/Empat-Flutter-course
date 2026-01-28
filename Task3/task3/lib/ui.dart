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
  final List<String> _images;
  const MyBody({super.key, required List<String> images}) : _images = images;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: GridView.count(
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        children: _images.map((path) {
          return GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                PageRouteBuilder(
                  opaque: false,
                  barrierColor: Colors.black,
                  pageBuilder: (_, _, _) {
                    return _FakeFullScreen(imagePath: path);
                  },
                ),
              );
            },
            child: Hero(
              tag: path,
              child: Image.asset(path, fit: BoxFit.cover),
            ),
          );
        }).toList(),
      ),
    );
  }
}

class _FakeFullScreen extends StatelessWidget {
  final String _imagePath;

  const _FakeFullScreen({required String imagePath}) : _imagePath = imagePath;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pop(context),
      child: Scaffold(
        backgroundColor: Colors.grey[850],
        body: Center(
          child: Hero(tag: _imagePath, child: Image.asset(_imagePath)),
        ),
      ),
    );
  }
}
