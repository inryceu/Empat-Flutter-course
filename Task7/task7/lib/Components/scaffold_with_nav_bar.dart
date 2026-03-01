import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ScaffoldWithNavBar extends StatelessWidget {
  final StatefulNavigationShell navigationShell;

  const ScaffoldWithNavBar({required this.navigationShell, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: _CustomBottomNavBar(
        navigationShell: navigationShell,
      ),
    );
  }
}

class _CustomBottomNavBar extends StatelessWidget {
  final StatefulNavigationShell navigationShell;

  const _CustomBottomNavBar({required this.navigationShell});

  void _onItemTapped(int index) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: navigationShell.currentIndex,
      onTap: _onItemTapped,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.add_circle_outline),
          label: 'Створити',
        ),
        BottomNavigationBarItem(icon: Icon(Icons.history), label: 'Історія'),
        BottomNavigationBarItem(icon: Icon(Icons.local_pizza), label: 'Готові'),
      ],
    );
  }
}
