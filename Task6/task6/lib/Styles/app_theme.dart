import 'package:flutter/material.dart';

class AppTheme {
  static const _seed = Colors.deepOrange;

  static final light = ThemeData(
    useMaterial3: true,
    colorScheme:
        ColorScheme.fromSeed(
          seedColor: _seed,
          brightness: Brightness.light,
        ).copyWith(
          secondary: const Color(0xFFD84315),
          surface: const Color(0xFFFFF3E0),
        ),
    scaffoldBackgroundColor: const Color(0xFFF5F5F5),

    cardTheme: const CardThemeData(
      elevation: 6,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
    ),

    chipTheme: const ChipThemeData(selectedColor: Color(0xFFFFB74D)),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 14),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    ),
  );

  static final dark = ThemeData(
    useMaterial3: true,
    colorScheme:
        ColorScheme.fromSeed(
          seedColor: _seed,
          brightness: Brightness.dark,
        ).copyWith(
          secondary: const Color(0xFFFF7043),
          surface: const Color(0xFF1E1E1E),
        ),
    scaffoldBackgroundColor: const Color(0xFF121212),

    cardTheme: const CardThemeData(
      elevation: 6,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
    ),

    chipTheme: const ChipThemeData(selectedColor: Color(0xFFFF8A65)),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 14),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        backgroundColor: const Color(0xFFFF8A65),
        foregroundColor: Colors.black,
      ),
    ),
  );
}
