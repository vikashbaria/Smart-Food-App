import 'package:flutter/material.dart';

class AppColors {
  // Gradient colors
  static const Color gradientStart = Color(0xFFE55A2B);
  static const Color gradientEnd = Color(0xFFFF6B35);

  static const Color nichewalagradientStart = Color(0xFFFFC107);
  static const Color nichewalagradientend = Color(0xFFFFA000);

  // App bar color
  static const Color appBar = Color(0xFFFF6B35);

  // Navigation bar color with 50% opacity
  static const Color navBar = Color(0x80FF6B35); // 80 = 50% opacity in hex
}

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      fontFamily: 'Inter',
      primaryColor: AppColors.appBar,
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.appBar,
        foregroundColor: Colors.white,
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: AppColors.navBar,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.black54,
      ),
    );
  }

  // Reusable gradient
  static const LinearGradient appGradient = LinearGradient(
    colors: [AppColors.gradientStart, AppColors.gradientEnd],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient nichewalaGradient = LinearGradient(
    colors: [AppColors.nichewalagradientStart, AppColors.nichewalagradientend],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}
