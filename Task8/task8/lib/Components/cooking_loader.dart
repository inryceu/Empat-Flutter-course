import 'package:flutter/material.dart';
import 'dart:math' as math;

class FireCurve extends Curve {
  final double offset;
  const FireCurve(this.offset);

  @override
  double transformInternal(double t) {
    final double wave1 = math.sin(t * 2 * math.pi * 4 + offset);
    final double wave2 = math.sin(t * 2 * math.pi * 6 - offset * 0.5);
    return ((wave1 + wave2) / 2 + 1) / 2;
  }
}

class CookingLoader extends StatefulWidget {
  const CookingLoader({super.key});

  @override
  State<CookingLoader> createState() => _CookingLoaderState();
}

class _CookingLoaderState extends State<CookingLoader>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  late List<Animation<double>> _heightAnimations;
  late List<Animation<Color?>> _colorAnimations;

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
      duration: const Duration(milliseconds: 5500),
    )..repeat();

    _heightAnimations = [];
    _colorAnimations = [];

    for (int i = 0; i < _distribution.length; i++) {
      final curve = CurvedAnimation(
        parent: _controller,
        curve: FireCurve(i * 0.8),
      );

      final maxColumnHeight = 15.0 + (75.0 * _distribution[i]);
      _heightAnimations.add(
        Tween<double>(begin: 15.0, end: maxColumnHeight).animate(curve),
      );

      _colorAnimations.add(
        ColorTween(
          begin: Colors.orange.shade300,
          end: Colors.deepOrange.shade900,
        ).animate(curve),
      );
    }
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
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: List.generate(_distribution.length, (index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 3),
              child: Container(
                width: 10,
                height: _heightAnimations[index].value,
                decoration: BoxDecoration(
                  color: _colorAnimations[index].value,
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
