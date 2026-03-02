import 'package:dio/dio.dart';

import '../Models/topping_model.dart';
import '../Domain/pizza.dart';

class ApiService {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'http://10.0.2.2:3000',
      connectTimeout: const Duration(seconds: 3),
      receiveTimeout: const Duration(seconds: 3),
    ),
  );

  Future<List<Pizza>> getPizzas() async {
    try {
      final response = await _dio.get('/pizzas');
      final List data = response.data;
      return data.map((e) => Pizza.fromJson(e)).toList();
    } catch (error) {
      throw Exception('Помилка завантаження піц: $error');
    }
  }

  Future<List<Topping>> getToppings() async {
    try {
      final response = await _dio.get('/toppings');
      final List data = response.data;
      return data.map((e) => Topping.fromJson(e)).toList();
    } catch (error) {
      throw Exception('Помилка завантаження топінгів: $error');
    }
  }
}
