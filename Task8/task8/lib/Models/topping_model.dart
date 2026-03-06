class Topping {
  final int id;
  final String name;

  Topping({required this.id, required this.name});

  factory Topping.fromJson(Map<String, dynamic> json) {
    return Topping(id: json['id'], name: json['name']);
  }
}
