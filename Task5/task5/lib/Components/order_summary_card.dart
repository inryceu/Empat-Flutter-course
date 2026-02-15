import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Models/pizza_model.dart';

class OrderSummaryCard extends StatelessWidget {
  const OrderSummaryCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      color: Colors.orange[50],
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Consumer<PizzaOrderModel>(
          builder: (context, model, child) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Ваше замовлення:',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const Divider(),
                  Text(
                    'Розмір: ${model.size.name.toUpperCase()}',
                    style: const TextStyle(fontSize: 18),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    model.selectedToppings.isEmpty
                        ? 'Без добавок'
                        : 'Добавки: ${model.selectedToppings.join(', ')}',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontStyle: FontStyle.italic,
                      fontSize: 18,
                    ),
                  ),
                  const Divider(),
                  Text(
                    'Сума: ${model.totalPrice.toStringAsFixed(0)} грн',
                    style: const TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepOrange,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
