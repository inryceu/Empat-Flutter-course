import 'pizza.dart';

class Order {
  final String id;
  final DateTime date;
  final List<Pizza> pizzas;
  final double totalAmount;

  Order({
    required this.id,
    required this.date,
    required this.pizzas,
    required this.totalAmount,
  });
}
