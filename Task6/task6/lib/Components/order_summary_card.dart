import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Models/pizza_model.dart';

class OrderSummaryCard extends StatelessWidget {
  const OrderSummaryCard({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Consumer<PizzaOrderModel>(
          builder: (context, model, child) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Ваше замовлення:',
                  style: theme.textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Divider(),
                Text(
                  'Розмір: ${model.size.name.toUpperCase()}',
                  style: theme.textTheme.titleMedium,
                ),
                const SizedBox(height: 8),
                Text(
                  model.selectedToppings.isEmpty
                      ? 'Без добавок'
                      : 'Добавки: ${model.selectedToppings.join(', ')}',
                  textAlign: TextAlign.center,
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontStyle: FontStyle.italic,
                  ),
                ),
                const Divider(),
                Text(
                  'Сума: ${model.totalPrice.toStringAsFixed(0)} грн',
                  style: theme.textTheme.displaySmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: theme.colorScheme.primary,
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
