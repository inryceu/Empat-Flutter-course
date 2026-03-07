import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

import 'topping_model.dart';
import '../Domain/pizza.dart';
import '../Domain/order.dart';

import '../Services/api_service.dart';

enum PizzaSize { small, medium, large }

class PizzaOrderModel extends ChangeNotifier {
  final ApiService _apiService = ApiService();

  final Set<String> _selectedToppings = {};
  List<Topping> toppings = [];
  final List<Pizza> _cart = [];
  final List<Order> _orderHistory = [];

  static const double _smallPrice = 100.0;
  static const double _mediumPrice = 150.0;
  static const double _largePrice = 250.0;
  static const double _toppingPrice = 25.0;

  PizzaSize _size = PizzaSize.medium;
  bool isLoading = false;
  String? errorMessage;

  PizzaSize get size => _size;
  List<String> get selectedToppings => _selectedToppings.toList();
  List<Pizza> get cart => List.unmodifiable(_cart);
  List<Order> get orderHistory => List.unmodifiable(_orderHistory);

  double get currentBuilderPrice {
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

  double get cartTotalPrice {
    return _cart.fold(0, (sum, pizza) => sum + pizza.price);
  }

  Future<void> loadToppings() async {
    isLoading = true;
    notifyListeners();

    try {
      toppings = await _apiService.getToppings();
    } catch (e) {
      toppings = [];
      errorMessage = "Не вдалося підключитися до сервера";
    } finally {
      isLoading = false;
      notifyListeners();
    }
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

  void loadReadyPizzaIntoBuilder(Pizza readyPizza) {
    _size = readyPizza.size;
    _selectedToppings.clear();
    _selectedToppings.addAll(readyPizza.toppings);
    notifyListeners();
  }

  void addPizzaToCart({Pizza? readyPizza}) {
    if (readyPizza != null) {
      _cart.add(readyPizza);
    } else {
      final customPizza = Pizza(
        id: const Uuid().v4(),
        name: 'Кастомна піца',
        size: _size,
        toppings: _selectedToppings.toList(),
        price: currentBuilderPrice,
      );
      _cart.add(customPizza);
      clearOrder();
    }
    notifyListeners();
  }

  void removeFromCart(String pizzaId) {
    _cart.removeWhere((p) => p.id == pizzaId);
    notifyListeners();
  }

  void checkout() {
    if (_cart.isEmpty) return;

    final newOrder = Order(
      id: const Uuid().v4(),
      date: DateTime.now(),
      pizzas: List.from(_cart),
      totalAmount: cartTotalPrice,
    );

    _orderHistory.insert(0, newOrder);
    _cart.clear();
    notifyListeners();
  }
}
