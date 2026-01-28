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

class MyGrid extends StatelessWidget {
  final List<String> _images;
  const MyGrid({super.key, required List<String> images}) : _images = images;

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

class MyAppDrawer extends StatelessWidget {
  final int _selectedIndex;
  final void Function(int) _onItemSelected;

  const MyAppDrawer({
    super.key,
    required int selectedIndex,
    required void Function(int) onItemSelected,
  }) : _onItemSelected = onItemSelected,
       _selectedIndex = selectedIndex;

  @override
  Widget build(BuildContext context) {
    return Drawer(
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
          _buildTile(context, icon: Icons.apps, title: "All", index: 0),
          _buildTile(context, icon: Icons.pets, title: "Animals", index: 1),
          _buildTile(
            context,
            icon: Icons.extension,
            title: "Different",
            index: 2,
          ),
        ],
      ),
    );
  }

  Widget _buildTile(
    BuildContext context, {
    required IconData icon,
    required String title,
    required int index,
  }) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      selected: _selectedIndex == index,
      onTap: () {
        _onItemSelected(index);
        Navigator.pop(context);
      },
    );
  }
}

class MyBody extends StatelessWidget {
  final int _selectedIndex;
  final List<Widget> _pages;
  final void Function(int) _onIndexChanged;

  const MyBody({
    super.key,
    required int selectedIndex,
    required List<Widget> pages,
    required void Function(int) onIndexChanged,
  }) : _onIndexChanged = onIndexChanged,
       _pages = pages,
       _selectedIndex = selectedIndex;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(child: _pages[_selectedIndex]),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              FloatingActionButton(
                onPressed: () {
                  final newIndex = _selectedIndex > 0
                      ? _selectedIndex - 1
                      : _pages.length - 1;
                  _onIndexChanged(newIndex);
                },
                child: const Icon(Icons.arrow_back),
              ),
              FloatingActionButton(
                onPressed: () {
                  final newIndex = _selectedIndex < _pages.length - 1
                      ? _selectedIndex + 1
                      : 0;
                  _onIndexChanged(newIndex);
                },
                child: const Icon(Icons.arrow_forward),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class MyBottomNavBar extends StatelessWidget {
  final int _selectedIndex;
  final void Function(int) _onItemSelected;

  const MyBottomNavBar({
    super.key,
    required int selectedIndex,
    required void Function(int) onItemSelected,
  }) : _onItemSelected = onItemSelected,
       _selectedIndex = selectedIndex;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.grey[350],
      currentIndex: _selectedIndex,
      onTap: _onItemSelected,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.apps), label: 'All'),
        BottomNavigationBarItem(icon: Icon(Icons.pets), label: 'Animals'),
        BottomNavigationBarItem(
          icon: Icon(Icons.extension),
          label: 'Different',
        ),
      ],
    );
  }
}
