import 'package:flutter/material.dart';

enum PizzaSize { small, medium, large }

class PizzaOrderModel extends ChangeNotifier {
  PizzaSize _size = PizzaSize.medium;
  final Set<String> _selectedToppings = {};

  static const double _smallPrice = 100.0;
  static const double _mediumPrice = 150.0;
  static const double _largePrice = 250.0;
  static const double _toppingPrice = 25.0;

  PizzaSize get size => _size;
  List<String> get selectedToppings => _selectedToppings.toList();

  double get totalPrice {
    double base = 0;
    switch (_size) {
      case PizzaSize.small:
        base = _smallPrice;
        break;
      case PizzaSize.medium:
        base = _mediumPrice;
        break;
      case PizzaSize.large:
        base = _largePrice;
        break;
    }
    return base + (_selectedToppings.length * _toppingPrice);
  }

  void setSize(PizzaSize newSize) {
    _size = newSize;
    notifyListeners();
  }

  void toggleTopping(String topping) {
    if (_selectedToppings.contains(topping)) {
      _selectedToppings.remove(topping);
    } else {
      _selectedToppings.add(topping);
    }
    notifyListeners();
  }

  void clearOrder() {
    _size = PizzaSize.medium;
    _selectedToppings.clear();
    notifyListeners();
  }
}
