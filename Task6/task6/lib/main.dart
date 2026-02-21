import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './Models/pizza_model.dart';
import './Models/theme_model.dart';
import './Pages/home_page.dart';
import './Styles/app_theme.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => PizzaOrderModel()),
        ChangeNotifierProvider(create: (_) => ThemeModel()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeModel>(
      builder: (context, themeProvider, _) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,

          theme: AppTheme.light,
          darkTheme: AppTheme.dark,

          themeMode: themeProvider.themeMode,

          home: const HomePage(),
        );
      },
    );
  }
}
