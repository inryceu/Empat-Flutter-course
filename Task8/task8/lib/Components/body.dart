import 'package:flutter/material.dart';

import 'order_summary_card.dart';
import 'controls_area.dart';

class MyBody extends StatelessWidget {
  const MyBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [OrderSummaryCard(), SizedBox(height: 16), ControlsArea()],
        ),
      ),
    );
  }
}
