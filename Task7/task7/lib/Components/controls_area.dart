import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Models/pizza_model.dart';

class ControlsArea extends StatelessWidget {
  const ControlsArea({super.key});

  @override
  Widget build(BuildContext context) {
    return const Card(
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _SizeSelectionSection(),
            Divider(height: 32),
            _ToppingsSelectionSection(),
            Divider(height: 32),
            _PriceSummarySection(),
            SizedBox(height: 16),
            _ActionButtonsSection(),
          ],
        ),
      ),
    );
  }
}

class _SizeSelectionSection extends StatelessWidget {
  const _SizeSelectionSection();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text('Оберіть розмір:', style: theme.textTheme.titleMedium),
        const SizedBox(height: 8),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _SizeRadioButton(size: PizzaSize.small, label: 'S'),
            _SizeRadioButton(size: PizzaSize.medium, label: 'M'),
            _SizeRadioButton(size: PizzaSize.large, label: 'L'),
          ],
        ),
      ],
    );
  }
}

class _SizeRadioButton extends StatelessWidget {
  final PizzaSize size;
  final String label;

  const _SizeRadioButton({required this.size, required this.label});

  @override
  Widget build(BuildContext context) {
    final model = context.watch<PizzaOrderModel>();
    final theme = Theme.of(context);

    return Column(
      children: [
        Radio<PizzaSize>(
          value: size,
          groupValue: model.size,
          onChanged: (value) {
            if (value != null) {
              model.setSize(value);
            }
          },
        ),
        Text(label, style: theme.textTheme.bodyMedium),
      ],
    );
  }
}

class _ToppingsSelectionSection extends StatelessWidget {
  const _ToppingsSelectionSection();

  @override
  Widget build(BuildContext context) {
    final model = context.watch<PizzaOrderModel>();
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          'Додайте інгредієнти (+25 грн):',
          style: theme.textTheme.titleMedium,
        ),
        const SizedBox(height: 12),
        _buildContent(context, model, theme),
      ],
    );
  }

  Widget _buildContent(
    BuildContext context,
    PizzaOrderModel model,
    ThemeData theme,
  ) {
    if (model.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (model.errorMessage != null) {
      return Column(
        children: [
          Text(
            model.errorMessage!,
            style: theme.textTheme.bodyMedium?.copyWith(
              color: theme.colorScheme.error,
            ),
          ),
          const SizedBox(height: 8),
          ElevatedButton(
            onPressed: () => model.loadToppings(),
            child: const Text("Спробувати знову"),
          ),
        ],
      );
    }

    if (model.toppings.isEmpty) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          "Список інгредієнтів порожній",
          style: theme.textTheme.bodyMedium?.copyWith(
            color: theme.colorScheme.onSurfaceVariant,
          ),
          textAlign: TextAlign.center,
        ),
      );
    }

    return Wrap(
      alignment: WrapAlignment.spaceEvenly,
      spacing: 8,
      runSpacing: 8,
      children: model.toppings.map((topping) {
        return _ToppingChip(label: topping.name);
      }).toList(),
    );
  }
}

class _ToppingChip extends StatelessWidget {
  final String label;

  const _ToppingChip({required this.label});

  @override
  Widget build(BuildContext context) {
    final model = context.watch<PizzaOrderModel>();
    final isSelected = model.selectedToppings.contains(label);

    return FilterChip(
      label: Text(label),
      selected: isSelected,
      showCheckmark: false,
      onSelected: (_) {
        model.toggleTopping(label);
      },
    );
  }
}

class _PriceSummarySection extends StatelessWidget {
  const _PriceSummarySection();

  @override
  Widget build(BuildContext context) {
    final model = context.watch<PizzaOrderModel>();
    final theme = Theme.of(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('Загальна сума:', style: theme.textTheme.titleMedium),
        Text(
          '${model.currentBuilderPrice.toStringAsFixed(0)} ₴',
          style: theme.textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
            color: theme.colorScheme.tertiary,
          ),
        ),
      ],
    );
  }
}

class _ActionButtonsSection extends StatelessWidget {
  const _ActionButtonsSection();

  @override
  Widget build(BuildContext context) {
    final model = context.watch<PizzaOrderModel>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ElevatedButton(
          onPressed: () {
            model.addPizzaToCart();
            model.checkout();
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Замовлення успішно створено!')),
            );
          },
          child: const Text('Створити замовлення'),
        ),
        const SizedBox(height: 12),
        OutlinedButton.icon(
          onPressed: () => model.clearOrder(),
          icon: const Icon(Icons.refresh),
          label: const Text('Скинути налаштування'),
        ),
      ],
    );
  }
}
