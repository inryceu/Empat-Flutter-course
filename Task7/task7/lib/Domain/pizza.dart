import '../Models/pizza_model.dart';

class Pizza {
  final String id;
  final String name;
  final PizzaSize size;
  final List<String> toppings;
  final double price;

  Pizza({
    required this.id,
    this.name = 'Кастомна',
    required this.size,
    required this.toppings,
    required this.price,
  });

  factory Pizza.fromJson(Map<String, dynamic> json) {
    return Pizza(
      id: json['id'],
      name: json['name'],
      size: PizzaSize.values.firstWhere(
        (e) => e.name == json['size'],
        orElse: () => PizzaSize.medium,
      ),
      toppings: List<String>.from(json['toppings']),
      price: (json['price'] as num).toDouble(),
    );
  }
}
