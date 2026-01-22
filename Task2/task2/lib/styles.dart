import 'package:flutter/material.dart';

class NavBarStyleWidget extends StatelessWidget {
  final Widget child;
  final VoidCallback? onPressed;

  const NavBarStyleWidget({required this.child, this.onPressed, Key? key})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: Colors.grey[800],
        shape: BoxShape.rectangle,
      ),
      child: child,
    );
  }
}

ButtonStyle NavBarButtonStyle() => TextButton.styleFrom(
  padding: const EdgeInsets.all(5.0),
  minimumSize: Size.zero,
  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
);
