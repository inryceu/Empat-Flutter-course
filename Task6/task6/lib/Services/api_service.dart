import 'package:dio/dio.dart';
import '../Models/topping_model.dart';

class ApiService {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'http://10.0.2.2:3000',
      connectTimeout: const Duration(seconds: 3),
      receiveTimeout: const Duration(seconds: 3),
    ),
  );

  Future<List<Topping>> getToppings() {
    return _dio
        .get('/toppings')
        .then((response) {
          final List data = response.data;
          return data.map((e) => Topping.fromJson(e)).toList();
        })
        .catchError((error) {
          throw Exception('API error: $error');
        });
  }
}
