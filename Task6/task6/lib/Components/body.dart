import 'package:flutter/material.dart';
import './order_summary_card.dart';
import './controls_area.dart';

class MyBody extends StatelessWidget {
  const MyBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [OrderSummaryCard(), ControlsArea()],
        ),
      ),
    );
  }
}
