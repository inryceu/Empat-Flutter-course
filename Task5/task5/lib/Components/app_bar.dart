import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 10,
        children: [
          Icon(Icons.local_pizza, size: 32),
          Text(
            'Pizza Constructor',
            style: TextStyle(
              fontWeight: FontWeight.w800,
              color: Colors.black,
              fontSize: 32,
            ),
          ),
        ],
      ),
      backgroundColor: Colors.orange[400],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
