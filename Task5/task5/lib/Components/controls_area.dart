import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Models/pizza_model.dart';

class ControlsArea extends StatelessWidget {
  const ControlsArea({super.key});

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<PizzaOrderModel>(context);

    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const Text('Оберіть розмір:', style: TextStyle(fontSize: 18)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildRadioBtn(model, PizzaSize.small, 'S'),
                _buildRadioBtn(model, PizzaSize.medium, 'M'),
                _buildRadioBtn(model, PizzaSize.large, 'L'),
              ],
            ),

            const Divider(height: 30),
            const Text(
              'Додайте інгредієнти (+25 грн):',
              style: TextStyle(fontSize: 18),
            ),

            Wrap(
              alignment: WrapAlignment.spaceEvenly,
              spacing: 5,
              children: [
                _buildToppingChip(model, 'Сир'),
                _buildToppingChip(model, 'Бекон'),
                _buildToppingChip(model, 'Оливки'),
                _buildToppingChip(model, 'Курка'),
                _buildToppingChip(model, 'Салямі'),
                _buildToppingChip(model, 'Кукурудза'),
                _buildToppingChip(model, 'Солоні огірки'),
                _buildToppingChip(model, 'Гриби'),
                _buildToppingChip(model, 'Ананас'),
                _buildToppingChip(model, 'Помідор'),
                _buildToppingChip(model, 'Чілі'),
              ],
            ),
            const Divider(height: 30),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.redAccent,
                      foregroundColor: Colors.white,
                    ),
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

  Widget _buildRadioBtn(PizzaOrderModel model, PizzaSize size, String label) {
    return Column(
      children: [
        RadioGroup<PizzaSize>(
          groupValue: model.size,
          onChanged: (PizzaSize? value) {
            if (value != null) model.setSize(value);
          },
          child: Radio<PizzaSize>(value: size),
        ),
        Text(label),
      ],
    );
  }

  Widget _buildToppingChip(PizzaOrderModel model, String label) {
    final isSelected = model.selectedToppings.contains(label);
    return FilterChip(
      label: Text(label),
      selected: isSelected,
      onSelected: (_) {
        model.toggleTopping(label);
      },
      selectedColor: Colors.orangeAccent,
    );
  }
}
