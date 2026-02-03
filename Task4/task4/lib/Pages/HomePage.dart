import 'package:flutter/material.dart';
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
      appBar: AppBar(
        title: Text(
          "Total items: $_totalItems\nTotal price: \$${_totalPrice.toStringAsFixed(2)}",
          style: TextStyle(
            fontFamily: "Roboto",
            fontSize: 24,
            fontWeight: FontWeight.w700,
            color: Colors.black,
            backgroundColor: Colors.blueGrey,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Shop Items:",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            ..._shopItems,
            Divider(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Cart:",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            if (_cart.isEmpty)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Cart is empty."),
              )
            else
              ..._cart.values.map((entry) {
                final CartItem item = entry['item'];
                final int quantity = entry['quantity'];
                return ListTile(
                  leading: Image.asset(
                    item.path,
                    width: 40,
                    height: 40,
                    fit: BoxFit.cover,
                  ),
                  title: Text(item.name),
                  subtitle: Text('Quantity: $quantity'),
                  trailing: Text((item.price * quantity).toStringAsFixed(2)),
                );
              }),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: TextButton(onPressed: _resetCart, child: Text("Reset cart")),
      ),
    );
  }
}
