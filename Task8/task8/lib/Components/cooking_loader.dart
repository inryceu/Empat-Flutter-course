import 'package:flutter/material.dart';
import 'dart:math' as math;

class CookingLoader extends StatefulWidget {
  const CookingLoader({super.key});

  @override
  State<CookingLoader> createState() => _CookingLoaderState();
}

class _CookingLoaderState extends State<CookingLoader>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  final List<double> _distribution = [
    0.3,
    0.5,
    0.8,
    1.1,

    1.3,

    1.1,
    0.8,
    0.5,
    0.3,
  ];

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 7500),
    );

    _controller.repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        final double t = _controller.value;

        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: List.generate(_distribution.length, (index) {
            final double wave1 = math.sin(t * 2 * math.pi * 4 + index * 0.8);
            final double wave2 = math.sin(t * 2 * math.pi * 6 - index * 0.5);

            final double factor = ((wave1 + wave2) / 2 + 1) / 2;

            final double currentHeight =
                15.0 + (75.0 * _distribution[index] * factor);

            final Color? currentColor = Color.lerp(
              Colors.orange.shade300,
              Colors.deepOrange.shade900,
              factor,
            );

            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 3),
              child: Container(
                width: 10,
                height: currentHeight,
                decoration: BoxDecoration(
                  color: currentColor,
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            );
          }),
        );
      },
    );
  }
}
