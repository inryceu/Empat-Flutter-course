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
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.shopping_cart, color: Colors.white),
          SizedBox(width: 8),
          Expanded(
            child: Text(
              "Total items: $_totalItems\nTotal price: \$${_totalPrice.toStringAsFixed(2)}",
              style: TextStyle(
                fontFamily: "Roboto",
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
      backgroundColor: Colors.teal.shade700,
      elevation: 4,
      shadowColor: Colors.black26,
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
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Shop Items:",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.teal.shade800,
              ),
            ),
            SizedBox(height: 16),
            ShopItemsGrid(shopItems: _shopItems),

            Divider(height: 32, thickness: 2),
            Text(
              "Cart:",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.teal.shade800,
              ),
            ),
            SizedBox(height: 16),
            CartWidget(cart: _cart),
          ],
        ),
      ),
    );
  }
}

class ShopItemsGrid extends StatelessWidget {
  final List<CartItem> shopItems;
  const ShopItemsGrid({super.key, required this.shopItems});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 0.8,
      ),
      itemCount: shopItems.length,
      itemBuilder: (context, index) {
        return Card(
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: shopItems[index],
        );
      },
    );
  }
}

class CartWidget extends StatelessWidget {
  final Map<String, Map<String, dynamic>> cart;
  const CartWidget({super.key, required this.cart});

  @override
  Widget build(BuildContext context) {
    if (cart.isEmpty) {
      return Card(
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            "Cart is empty.",
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),
        ),
      );
    } else {
      return Column(
        children: cart.values.map((entry) {
          final CartItem item = entry['item'];
          final int quantity = entry['quantity'];
          return Card(
            elevation: 2,
            margin: EdgeInsets.only(bottom: 8),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            child: ListTile(
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  item.path,
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                ),
              ),
              title: Text(
                item.name,
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              subtitle: Text('Quantity: $quantity'),
              trailing: Text(
                '\$${(item.price * quantity).toStringAsFixed(2)}',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.teal.shade700,
                ),
              ),
            ),
          );
        }).toList(),
      );
    }
  }
}

class MyBottomAppBar extends StatelessWidget {
  final VoidCallback _resetCart;
  const MyBottomAppBar({super.key, required VoidCallback resetCart})
    : _resetCart = resetCart;

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.teal.shade50,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 6.0),
        child: ElevatedButton.icon(
          onPressed: _resetCart,
          icon: Icon(Icons.refresh, color: Colors.white),
          label: Text(
            "Reset Cart",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red.shade600,
            foregroundColor: Colors.white,
            padding: EdgeInsets.symmetric(vertical: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
      ),
    );
  }
}
