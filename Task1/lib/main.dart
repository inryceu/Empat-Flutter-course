import 'package:flutter/material.dart';
import 'pages/HomePage.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomePage());
  }
}

void main() {
  runApp(const MyApp());
}

/*
1) Оператори "синтаксичного цукру". Наприклад оператор "??=" 
2) Використання лямбда-функцій, замикань 
3) Використання параметрів за замовчуванням 
4) Різні варіанти конструкторів: 
  4.1) Фабричний конструктор
  4.2) Конструктор ініціалізації 
5) Використання міксинів 
6) Використання ключового слова assert 
7) Робота з різними типами колекцій.
*/
