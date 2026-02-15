import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './Models/pizza_model.dart';
import './Pages/home_page.dart';

void main() => runApp(
  ChangeNotifierProvider(
    create: (context) => PizzaOrderModel(),
    child: const MyApp(),
  ),
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.orange),
      home: const HomePage(),
    );
  }
}
