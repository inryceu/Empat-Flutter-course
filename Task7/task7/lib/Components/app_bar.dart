import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Models/theme_model.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<ThemeModel>(context);
    final theme = Theme.of(context);

    return AppBar(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _logoBuilder(context),
          Switch(value: model.isDark, onChanged: (_) => model.toggleTheme()),
        ],
      ),
      backgroundColor: theme.colorScheme.primary,
      foregroundColor: theme.colorScheme.onPrimary,
    );
  }

  Widget _logoBuilder(BuildContext context) {
    final theme = Theme.of(context);

    return Row(
      children: [
        Icon(Icons.local_pizza, size: 28, color: theme.colorScheme.onPrimary),
        const SizedBox(width: 10),
        Text(
          'Pizza Constructor',
          style: theme.textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.w800,
            color: theme.colorScheme.onPrimary,
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
