import 'package:flutter/material.dart';
import 'package:task4/CartItem.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final int _totalItems;
  final double _totalPrice;
  const MyAppBar({super.key, required totalItems, required totalPrice})
    : _totalItems = totalItems,
      _totalPrice = totalPrice;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        "Total items: $_totalItems\nTotal price: \$${_totalPrice.toStringAsFixed(2)}",
        style: TextStyle(
          fontFamily: "Roboto",
          fontSize: 24,
          fontWeight: FontWeight.w700,
          color: Colors.black,
        ),
      ),
      backgroundColor: Colors.blueGrey,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class MyBody extends StatelessWidget {
  final List<CartItem> _shopItems;
  final Map<String, Map<String, dynamic>> _cart;
  const MyBody({
    super.key,
    required List<CartItem> shopItems,
    required Map<String, Map<String, dynamic>> cart,
  }) : _shopItems = shopItems,
       _cart = cart;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
    );
  }
}

class MyBottomAppBar extends StatelessWidget {
  final VoidCallback _resetCart;
  const MyBottomAppBar({super.key, required VoidCallback resetCart})
    : _resetCart = resetCart;

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: TextButton(onPressed: _resetCart, child: Text("Reset cart")),
    );
  }
}
