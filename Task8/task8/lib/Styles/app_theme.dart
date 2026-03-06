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
          tertiary: Colors.green.shade700,
          error: Colors.red.shade700,
          secondaryContainer: Colors.orange.shade50,
          onSecondaryContainer: Colors.deepOrange,
          onSurfaceVariant: Colors.grey.shade600,
          outline: Colors.grey,
          outlineVariant: Colors.grey.shade400,
        ),
    scaffoldBackgroundColor: const Color(0xFFF5F5F5),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
      titleTextStyle: TextStyle(
        color: Colors.black87,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      iconTheme: IconThemeData(color: Colors.black87),
    ),
    cardTheme: const CardThemeData(
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
    ),
    chipTheme: const ChipThemeData(
      selectedColor: Color(0xFFFFB74D),
      backgroundColor: Color(0xFFEEEEEE),
      labelStyle: TextStyle(color: Colors.black87),
      secondaryLabelStyle: TextStyle(
        color: Colors.black87,
        fontWeight: FontWeight.bold,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        backgroundColor: Colors.deepOrange,
        foregroundColor: Colors.white,
        textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 14),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        foregroundColor: Colors.deepOrange,
        side: const BorderSide(color: Colors.deepOrange),
      ),
    ),
    snackBarTheme: SnackBarThemeData(
      backgroundColor: Colors.green.shade700,
      contentTextStyle: const TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w500,
      ),
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    ),
    dividerTheme: const DividerThemeData(
      space: 24,
      thickness: 1,
      color: Colors.black12,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Colors.white,
      selectedItemColor: _seed,
      unselectedItemColor: Colors.grey.shade600,
      elevation: 8,
      type: BottomNavigationBarType.fixed,
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
          tertiary: Colors.green.shade400,
          error: Colors.red.shade400,
          secondaryContainer: const Color(0xFF3E2723),
          onSecondaryContainer: const Color(0xFFFF8A65),
          onSurfaceVariant: Colors.grey.shade400,
          outline: Colors.grey.shade600,
          outlineVariant: Colors.grey.shade700,
        ),
    scaffoldBackgroundColor: const Color(0xFF121212),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      iconTheme: IconThemeData(color: Colors.white),
    ),
    cardTheme: const CardThemeData(
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
    ),
    chipTheme: const ChipThemeData(
      selectedColor: Color(0xFFFF8A65),
      backgroundColor: Color(0xFF2C2C2C),
      labelStyle: TextStyle(color: Colors.white70),
      secondaryLabelStyle: TextStyle(
        color: Colors.black87,
        fontWeight: FontWeight.bold,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        backgroundColor: const Color(0xFFFF8A65),
        foregroundColor: Colors.black,
        textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 14),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        foregroundColor: const Color(0xFFFF8A65),
        side: const BorderSide(color: Color(0xFFFF8A65)),
      ),
    ),
    snackBarTheme: SnackBarThemeData(
      backgroundColor: Colors.green.shade800,
      contentTextStyle: const TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w500,
      ),
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    ),
    dividerTheme: const DividerThemeData(
      space: 24,
      thickness: 1,
      color: Colors.white24,
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Color(0xFF1E1E1E),
      selectedItemColor: Color(0xFFFF8A65),
      unselectedItemColor: Colors.white54,
      elevation: 8,
      type: BottomNavigationBarType.fixed,
    ),
  );
}
