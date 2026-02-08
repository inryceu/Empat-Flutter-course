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
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                _path,
                width: 120,
                height: 120,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 8),
            Text(
              _name,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.teal.shade800,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 4),
            Text(
              "\$${_price.toStringAsFixed(2)}",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.teal.shade600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
