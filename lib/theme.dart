import 'package:flutter/material.dart';

class AppColors {
  static const Color background = Color(0xFFF9FAFB); // Gray 50
  static const Color surface = Color(0xFFFFFFFF); // White
  static const Color primary = Color(0xFF0284C7); // Indigo 600
  static const Color textPrimary = Color(0xFF111827); // Gray 900
  static const Color textSecondary = Color(0xFF6B7280); // Gray 500
  static const Color accent = Color(0xFFEA580C); // Orange 600
}

class DarkAppColors {
  static const Color background = Color(0xFF0F172A); // Navy Gelap
  static const Color surface = Color(0xFF1E293B); // Card / Search Bar
  static const Color primary = Color(0xFF38BDF8); // Biru Cerah
  static const Color textPrimary = Color(0xFFF8FAFC); // Putih Bersih
  static const Color textSecondary = Color(0xFF94A3B8); // Abu-abu Kebiruan
  static const Color accent = Color(0xFFFBBF24); // Kuning Emas (Rating)
}

class AppTextStyles {
  static const TextStyle bottomBarLabel = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle cardTitle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimary,
  );
  static const TextStyle darkCardTitle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: DarkAppColors.textPrimary,
  );

  static const TextStyle cardSubtitle = TextStyle(
    fontSize: 13,
    color: AppColors.textPrimary,
  );
  static const TextStyle darkCardSubtitle = TextStyle(
    fontSize: 13,
    color: DarkAppColors.textPrimary,
  );

  static const TextStyle sectionTitle = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimary,
  );
  static const TextStyle darkSectionTitle = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: DarkAppColors.textPrimary,
  );

  static const TextStyle sectionHeader = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
  );
  static const TextStyle darkSectionHeader = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: DarkAppColors.textPrimary,
  );

  static const TextStyle bodySmall = TextStyle(
    fontSize: 12,
    color: AppColors.textSecondary,
  );
  static const TextStyle darkBodySmall = TextStyle(
    fontSize: 12,
    color: DarkAppColors.textSecondary,
  );

  static const TextStyle bodyMedium = TextStyle(
    fontSize: 15, // Used in latest manga
    color: AppColors.textSecondary,
  );
  static const TextStyle darkBodyMedium = TextStyle(
    fontSize: 15, // Used in latest manga
    color: DarkAppColors.textSecondary,
  );

  static const TextStyle rank = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: AppColors.accent,
  );
  static const TextStyle darkRank = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: DarkAppColors.accent,
  );
}

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      scaffoldBackgroundColor: AppColors.background,
      primaryColor: AppColors.primary,
      iconTheme: const IconThemeData(color: AppColors.primary, size: 20),
      textTheme: const TextTheme(
        headlineMedium: AppTextStyles.sectionTitle,
        titleLarge: AppTextStyles.cardTitle,
        titleMedium: AppTextStyles.sectionHeader,
        titleSmall: AppTextStyles.darkCardSubtitle,
        bodyMedium: AppTextStyles.bodyMedium,
        bodySmall: AppTextStyles.bodySmall,
        labelSmall: AppTextStyles.rank,
      ),
      colorScheme: const ColorScheme.light(
        primary: AppColors.primary,
        onPrimary: AppColors.background,
        surface: AppColors.background,
        onSurface: AppColors.textPrimary,
        surfaceContainer: AppColors.surface,
        secondary: AppColors.accent,
        onSecondary: AppColors.background,
        onSurfaceVariant: AppColors.textSecondary,
        error: Colors.redAccent,
        onError: Colors.black,
        // background: AppColors.background, // Deprecated in Flutter 3.22+, but let's stick to safe usage or use surface
      ),
      useMaterial3: true,
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      scaffoldBackgroundColor: DarkAppColors.background,
      primaryColor: DarkAppColors.primary,
      iconTheme: const IconThemeData(color: DarkAppColors.primary, size: 20),
      textTheme: const TextTheme(
        headlineMedium: AppTextStyles.darkSectionTitle,
        titleLarge: AppTextStyles.darkCardTitle,
        titleMedium: AppTextStyles.darkSectionHeader,
        titleSmall: AppTextStyles.darkCardSubtitle,
        bodyMedium: AppTextStyles.darkBodyMedium,
        bodySmall: AppTextStyles.darkBodySmall,
        labelSmall: AppTextStyles.darkRank,
      ),
      colorScheme: const ColorScheme.dark(
        primary: DarkAppColors.primary,
        onPrimary: DarkAppColors.background,
        surface: DarkAppColors.background,
        onSurface: DarkAppColors.textPrimary,
        surfaceContainer: DarkAppColors.surface,
        secondary: DarkAppColors.accent,
        onSecondary: DarkAppColors.background,
        onSurfaceVariant: DarkAppColors.textSecondary,
        error: Colors.redAccent,
        onError: Colors.white,
        // background: AppColors.background, // Deprecated in Flutter 3.22+, but let's stick to safe usage or use surface
      ),
      useMaterial3: true,
    );
  }
}
