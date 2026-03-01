import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../Domain/pizza.dart';

class PizzaDetailsPage extends StatelessWidget {
  final Pizza pizza;

  const PizzaDetailsPage({super.key, required this.pizza});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(pizza.name)),
      body: _PizzaDetailsBody(pizza: pizza),
      bottomNavigationBar: const _AddToCartButton(),
    );
  }
}

class _PizzaDetailsBody extends StatelessWidget {
  final Pizza pizza;

  const _PizzaDetailsBody({required this.pizza});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _PizzaImage(pizzaId: pizza.id),
            const SizedBox(height: 32),
            _PriceAndSizeInfo(pizza: pizza),
            const SizedBox(height: 24),
            _IngredientsList(toppings: pizza.toppings),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}

class _PizzaImage extends StatelessWidget {
  final String pizzaId;

  const _PizzaImage({required this.pizzaId});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Center(
      child: Hero(
        tag: 'pizza-image-$pizzaId',
        child: Container(
          width: 250,
          height: 250,
          decoration: BoxDecoration(
            color: theme.colorScheme.secondaryContainer,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: theme.colorScheme.onSecondaryContainer.withOpacity(0.2),
                blurRadius: 20,
                spreadRadius: 5,
              ),
            ],
          ),
          child: Icon(
            Icons.local_pizza,
            size: 150,
            color: theme.colorScheme.onSecondaryContainer,
          ),
        ),
      ),
    );
  }
}

class _PriceAndSizeInfo extends StatelessWidget {
  final Pizza pizza;

  const _PriceAndSizeInfo({required this.pizza});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Ціна',
              style: theme.textTheme.titleMedium?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
            Text(
              '${pizza.price.toStringAsFixed(0)} ₴',
              style: theme.textTheme.headlineMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: theme.colorScheme.tertiary,
              ),
            ),
          ],
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: theme.colorScheme.surface,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: theme.colorScheme.outlineVariant),
          ),
          child: Text(
            'Розмір: ${pizza.size.name.toUpperCase()}',
            style: theme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}

class _IngredientsList extends StatelessWidget {
  final List<String> toppings;

  const _IngredientsList({required this.toppings});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          'Інгредієнти',
          style: theme.textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 12),
        Wrap(
          spacing: 8.0,
          runSpacing: 8.0,
          children: toppings.isEmpty
              ? [
                  Text(
                    'Немає інгредієнтів',
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                  ),
                ]
              : toppings.map((topping) {
                  return Chip(
                    label: Text(topping),
                    backgroundColor: theme.colorScheme.surface,
                    side: BorderSide(color: theme.colorScheme.outlineVariant),
                    labelStyle: theme.textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                  );
                }).toList(),
        ),
      ],
    );
  }
}

class _AddToCartButton extends StatelessWidget {
  const _AddToCartButton();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ElevatedButton(
          onPressed: () {
            context.pop(true);
          },
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.shopping_cart_checkout),
              SizedBox(width: 8),
              Text('Додати в замовлення'),
            ],
          ),
        ),
      ),
    );
  }
}
