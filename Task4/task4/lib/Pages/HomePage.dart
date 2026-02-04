import 'package:flutter/material.dart';
import 'package:task4/components.dart';
import "../CartItem.dart";

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  final Map<String, Map<String, dynamic>> _cart = {};

  List<CartItem> get _shopItems => [
    CartItem(
      name: "apple",
      price: 9.99,
      path: "covers/1.jpg",
      onTap: _addItemToCart,
    ),
    CartItem(
      name: "banana",
      price: 12.50,
      path: "covers/2.jpg",
      onTap: _addItemToCart,
    ),
    CartItem(
      name: "qiwi",
      price: 15.75,
      path: "covers/3.jpg",
      onTap: _addItemToCart,
    ),
    CartItem(
      name: "orange",
      price: 8.55,
      path: "covers/4.jpg",
      onTap: _addItemToCart,
    ),
    CartItem(
      name: "tomato",
      price: 7.69,
      path: "covers/5.jpg",
      onTap: _addItemToCart,
    ),
  ];

  void _addItemToCart(CartItem item) {
    setState(() {
      if (_cart.containsKey(item.name)) {
        _cart[item.name]!['quantity'] += 1;
      } else {
        _cart[item.name] = {'item': item, 'quantity': 1};
      }
    });
  }

  void _resetCart() {
    setState(() {
      _cart.clear();
    });
  }

  int get _totalItems =>
      _cart.values.fold(0, (sum, entry) => sum + (entry['quantity'] as int));

  double get _totalPrice => _cart.values.fold(0.0, (sum, entry) {
    final item = entry['item'] as CartItem;
    final qty = entry['quantity'] as int;
    return sum + (item.price * qty);
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(totalItems: _totalItems, totalPrice: _totalPrice),
      body: MyBody(shopItems: _shopItems, cart: _cart),
      bottomNavigationBar: MyBottomAppBar(resetCart: _resetCart),
    );
  }
}
