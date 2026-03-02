import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../Models/pizza_model.dart';
import '../Domain/pizza.dart';
import '../Services/api_service.dart';

class ReadyPizzasPage extends StatefulWidget {
  const ReadyPizzasPage({super.key});

  @override
  State<ReadyPizzasPage> createState() => _ReadyPizzasPageState();
}

class _ReadyPizzasPageState extends State<ReadyPizzasPage> {
  final ApiService _apiService = ApiService();
  late Future<List<Pizza>> _pizzasFuture;

  @override
  void initState() {
    super.initState();
    _loadPizzas();
  }

  void _loadPizzas() {
    setState(() {
      _pizzasFuture = _apiService.getPizzas();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Готові піци'),
        actions: [
          IconButton(icon: const Icon(Icons.refresh), onPressed: _loadPizzas),
        ],
      ),
      body: FutureBuilder<List<Pizza>>(
        future: _pizzasFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const _LoadingState();
          }

          if (snapshot.hasError) {
            return _ErrorState(
              error: snapshot.error.toString(),
              onRetry: _loadPizzas,
            );
          }

          final pizzas = snapshot.data ?? [];

          if (pizzas.isEmpty) {
            return const _EmptyState();
          }

          return _PizzaList(pizzas: pizzas);
        },
      ),
    );
  }
}

class _LoadingState extends StatelessWidget {
  const _LoadingState();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Center(
      child: CircularProgressIndicator(color: theme.colorScheme.primary),
    );
  }
}

class _ErrorState extends StatelessWidget {
  final String error;
  final VoidCallback onRetry;

  const _ErrorState({required this.error, required this.onRetry});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.error_outline, size: 48, color: theme.colorScheme.error),
          const SizedBox(height: 16),
          Text(
            'Помилка: $error',
            style: theme.textTheme.bodyMedium?.copyWith(
              color: theme.colorScheme.onSurface,
            ),
          ),
          TextButton(onPressed: onRetry, child: const Text('Спробувати знову')),
        ],
      ),
    );
  }
}

class _EmptyState extends StatelessWidget {
  const _EmptyState();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Center(
      child: Text(
        'Піц поки немає в наявності',
        style: theme.textTheme.titleMedium?.copyWith(
          color: theme.colorScheme.onSurfaceVariant,
        ),
      ),
    );
  }
}

class _PizzaList extends StatelessWidget {
  final List<Pizza> pizzas;

  const _PizzaList({required this.pizzas});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemCount: pizzas.length,
      itemBuilder: (context, index) {
        return _PizzaCard(pizza: pizzas[index]);
      },
    );
  }
}

class _PizzaCard extends StatelessWidget {
  final Pizza pizza;

  const _PizzaCard({required this.pizza});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16.0),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: () => _handleTap(context),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            children: [
              _PizzaCardImage(pizzaId: pizza.id),
              const SizedBox(width: 16),
              Expanded(child: _PizzaCardInfo(pizza: pizza)),
              Icon(
                Icons.chevron_right,
                color: Theme.of(context).colorScheme.outline,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _handleTap(BuildContext context) async {
    final result = await context.pushNamed('pizza_details', extra: pizza);

    if (result == true && context.mounted) {
      context.read<PizzaOrderModel>().addPizzaToCart(readyPizza: pizza);
      context.read<PizzaOrderModel>().checkout();

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('${pizza.name} додано до історії замовлень!')),
      );
    }
  }
}

class _PizzaCardImage extends StatelessWidget {
  final String pizzaId;

  const _PizzaCardImage({required this.pizzaId});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Hero(
      tag: 'pizza-image-$pizzaId',
      child: Container(
        width: 80,
        height: 80,
        decoration: BoxDecoration(
          color: theme.colorScheme.secondaryContainer,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Icon(
          Icons.local_pizza,
          size: 45,
          color: theme.colorScheme.onSecondaryContainer,
        ),
      ),
    );
  }
}

class _PizzaCardInfo extends StatelessWidget {
  final Pizza pizza;

  const _PizzaCardInfo({required this.pizza});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          pizza.name,
          style: theme.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 6),
        Text(
          pizza.toppings.join(', '),
          style: theme.textTheme.bodySmall?.copyWith(
            color: theme.colorScheme.onSurfaceVariant,
          ),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(height: 8),
        Text(
          '${pizza.price.toStringAsFixed(0)} ₴',
          style: theme.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.w600,
            color: theme.colorScheme.tertiary,
          ),
        ),
      ],
    );
  }
}
