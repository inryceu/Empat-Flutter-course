import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Models/pizza_model.dart';

class OrderSummaryCard extends StatelessWidget {
  const OrderSummaryCard({super.key});

  @override
  Widget build(BuildContext context) {
    return const Card(
      child: Padding(padding: EdgeInsets.all(16), child: _SummaryContent()),
    );
  }
}

class _SummaryContent extends StatelessWidget {
  const _SummaryContent();

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _OrderHeader(),
        Divider(),
        _OrderSizeInfo(),
        SizedBox(height: 8),
        _OrderToppingsInfo(),
        Divider(),
        _OrderPriceInfo(),
      ],
    );
  }
}

class _OrderHeader extends StatelessWidget {
  const _OrderHeader();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Text(
      'Ваше замовлення:',
      style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
    );
  }
}

class _OrderSizeInfo extends StatelessWidget {
  const _OrderSizeInfo();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final model = context.watch<PizzaOrderModel>();

    return Text(
      'Розмір: ${model.size.name.toUpperCase()}',
      style: theme.textTheme.titleMedium,
    );
  }
}

class _OrderToppingsInfo extends StatelessWidget {
  const _OrderToppingsInfo();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final model = context.watch<PizzaOrderModel>();

    final hasToppings = model.selectedToppings.isNotEmpty;
    final text = hasToppings
        ? 'Добавки: ${model.selectedToppings.join(', ')}'
        : 'Без добавок';

    return Text(
      text,
      textAlign: TextAlign.center,
      style: theme.textTheme.titleMedium?.copyWith(fontStyle: FontStyle.italic),
    );
  }
}

class _OrderPriceInfo extends StatelessWidget {
  const _OrderPriceInfo();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final model = context.watch<PizzaOrderModel>();

    return Text(
      'Сума: ${model.currentBuilderPrice.toStringAsFixed(0)} ₴',
      style: theme.textTheme.displaySmall?.copyWith(
        fontWeight: FontWeight.bold,
        color: theme.colorScheme.tertiary,
      ),
    );
  }
}
