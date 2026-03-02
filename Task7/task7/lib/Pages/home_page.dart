import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Components/app_bar.dart';
import '../Components/body.dart';
import '../Models/pizza_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() => context.read<PizzaOrderModel>().loadToppings());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: const MyAppBar(), body: const MyBody());
  }
}
