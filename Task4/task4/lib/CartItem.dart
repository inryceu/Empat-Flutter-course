import 'package:flutter/material.dart';

class CartItem extends StatelessWidget {
  final String _name;
  final double _price;
  final String _path;
  final Function(CartItem) _onTap;

  const CartItem({
    super.key,
    required String name,
    required double price,
    required String path,
    required Function(CartItem) onTap,
  }) : _name = name,
       _price = price,
       _path = path,
       _onTap = onTap;

  String get name => _name;
  double get price => _price;
  String get path => _path;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _onTap(this),
      child: ListTile(
        leading: const Icon(Icons.shopping_basket),
        title: Image.asset(_path),
        subtitle: Text(
          "$_name | $_price \$",
          style: TextStyle(
            color: Colors.black,
            fontFamily: "Roboto",
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
