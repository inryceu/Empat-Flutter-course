import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Models/pizza_model.dart';

class ControlsArea extends StatelessWidget {
  const ControlsArea({super.key});

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<PizzaOrderModel>(context);
    final theme = Theme.of(context);

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Text('Оберіть розмір:', style: theme.textTheme.titleMedium),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildRadioBtn(context, model, PizzaSize.small, 'S'),
                _buildRadioBtn(context, model, PizzaSize.medium, 'M'),
                _buildRadioBtn(context, model, PizzaSize.large, 'L'),
              ],
            ),
            const Divider(height: 32),
            Text(
              'Додайте інгредієнти (+25 грн):',
              style: theme.textTheme.titleMedium,
            ),
            const SizedBox(height: 8),

            Consumer<PizzaOrderModel>(
              builder: (context, model, child) {
                if (model.isLoading) {
                  return const CircularProgressIndicator();
                }

                if (model.errorMessage != null) {
                  return Column(
                    children: [
                      Text(model.errorMessage!),
                      ElevatedButton(
                        onPressed: () {
                          context.read<PizzaOrderModel>().errorMessage = null;
                          context.read<PizzaOrderModel>().isLoading = true;
                          context.read<PizzaOrderModel>().loadToppings();
                        },
                        child: const Text("Спробувати знову"),
                      ),
                    ],
                  );
                }

                return Wrap(
                  alignment: WrapAlignment.spaceEvenly,
                  spacing: 5,
                  children: model.toppings.map((topping) {
                    return _buildToppingChip(context, model, topping.name);
                  }).toList(),
                );
              },
            ),

            const Divider(height: 32),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () => model.clearOrder(),
                    icon: const Icon(Icons.refresh),
                    label: const Text('Очистити кошик'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRadioBtn(
    BuildContext context,
    PizzaOrderModel model,
    PizzaSize size,
    String label,
  ) {
    return Column(
      children: [
        Radio<PizzaSize>(
          value: size,
          groupValue: model.size,
          onChanged: (value) {
            if (value != null) model.setSize(value);
          },
        ),
        Text(label, style: Theme.of(context).textTheme.bodyMedium),
      ],
    );
  }

  Widget _buildToppingChip(
    BuildContext context,
    PizzaOrderModel model,
    String label,
  ) {
    final isSelected = model.selectedToppings.contains(label);

    return FilterChip(
      label: Text(label),
      selected: isSelected,
      onSelected: (_) => model.toggleTopping(label),
    );
  }
}
