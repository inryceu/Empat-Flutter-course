import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';

import '../Models/pizza_model.dart';
import '../Domain/order.dart';
import '../Domain/pizza.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final orderHistory = context.watch<PizzaOrderModel>().orderHistory;

    return Scaffold(
      appBar: AppBar(title: const Text('Історія замовлень')),
      body: orderHistory.isEmpty
          ? const _EmptyHistoryState()
          : ListView.builder(
              padding: const EdgeInsets.all(16.0),
              itemCount: orderHistory.length,
              itemBuilder: (context, index) {
                return _OrderCard(order: orderHistory[index]);
              },
            ),
    );
  }
}

class _EmptyHistoryState extends StatelessWidget {
  const _EmptyHistoryState();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.receipt_long,
            size: 80,
            color: theme.colorScheme.outlineVariant,
          ),
          const SizedBox(height: 16),
          Text(
            'Ви ще нічого не замовляли',
            style: theme.textTheme.titleMedium?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }
}

class _OrderCard extends StatelessWidget {
  final Order order;

  const _OrderCard({required this.order});

  @override
  Widget build(BuildContext context) {
    if (order.pizzas.isEmpty) return const SizedBox.shrink();
    final pizza = order.pizzas.first;

    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: () async => _handleTap(context, pizza),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _OrderCardHeader(order: order),
              const Divider(),
              _OrderCardBody(pizza: pizza),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _handleTap(BuildContext context, Pizza pizza) async {
    final result = await context.pushNamed('pizza_details', extra: pizza);

    if (result == true && context.mounted) {
      context.read<PizzaOrderModel>().addPizzaToCart(readyPizza: pizza);
      context.read<PizzaOrderModel>().checkout();

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('${pizza.name} знову замовлено!')));
    }
  }
}

class _OrderCardHeader extends StatelessWidget {
  final Order order;

  const _OrderCardHeader({required this.order});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final d = order.date;
    final dateStr =
        '${d.day.toString().padLeft(2, '0')}.${d.month.toString().padLeft(2, '0')}.${d.year} '
        '${d.hour.toString().padLeft(2, '0')}:${d.minute.toString().padLeft(2, '0')}';

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          dateStr,
          style: theme.textTheme.bodyMedium?.copyWith(
            color: theme.colorScheme.onSurfaceVariant,
          ),
        ),
        Text(
          '${order.totalAmount.toStringAsFixed(0)} ₴',
          style: theme.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.bold,
            color: theme.colorScheme.tertiary,
          ),
        ),
      ],
    );
  }
}

class _OrderCardBody extends StatelessWidget {
  final Pizza pizza;

  const _OrderCardBody({required this.pizza});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: theme.colorScheme.secondaryContainer,
            shape: BoxShape.circle,
          ),
          child: Icon(
            Icons.local_pizza,
            color: theme.colorScheme.onSecondaryContainer,
            size: 32,
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                pizza.name,
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                'Розмір: ${pizza.size.name.toUpperCase()}',
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: theme.colorScheme.onSurface,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                pizza.toppings.isEmpty
                    ? "Без додаткових топінгів"
                    : pizza.toppings.join(", "),
                style: theme.textTheme.bodySmall?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
        Icon(Icons.chevron_right, color: theme.colorScheme.outline),
      ],
    );
  }
}
