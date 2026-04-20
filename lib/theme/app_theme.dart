import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Architectural Anchor Design System
/// Translated directly from the Stitch project design tokens.
class AppTheme {
  // ── Color Tokens ──────────────────────────────────────────────────
  static const Color primary = Color(0xFF00488D);
  static const Color primaryContainer = Color(0xFF005FB8);
  static const Color onPrimary = Color(0xFFFFFFFF);

  static const Color secondary = Color(0xFF4A5F83);
  static const Color secondaryContainer = Color(0xFFC0D5FF);
  static const Color onSecondaryContainer = Color(0xFF475C7F);

  static const Color tertiary = Color(0xFF7B3200);
  static const Color tertiaryContainer = Color(0xFFA04401);

  static const Color surface = Color(0xFFF9F9FF);
  static const Color surfaceContainerLowest = Color(0xFFFFFFFF);
  static const Color surfaceContainerLow = Color(0xFFF2F3FB);
  static const Color surfaceContainer = Color(0xFFECEDF6);
  static const Color surfaceContainerHigh = Color(0xFFE7E8F0);
  static const Color surfaceContainerHighest = Color(0xFFE1E2EA);
  static const Color surfaceDim = Color(0xFFD8DAE2);

  static const Color onSurface = Color(0xFF191C21);
  static const Color onSurfaceVariant = Color(0xFF424752);
  static const Color outlineVariant = Color(0xFFC2C6D4);
  static const Color outline = Color(0xFF727783);

  static const Color error = Color(0xFFBA1A1A);
  static const Color onError = Color(0xFFFFFFFF);
  static const Color errorContainer = Color(0xFFFFDAD6);
  static const Color onErrorContainer = Color(0xFF93000A);

  // ── Gradient ──────────────────────────────────────────────────────
  static const LinearGradient primaryGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [primary, primaryContainer],
  );

  // ── Shadow ────────────────────────────────────────────────────────
  static const BoxShadow ambientShadow = BoxShadow(
    color: Color(0x14004A8D), // rgba(0,72,141,0.08)
    blurRadius: 40,
    offset: Offset(0, 12),
  );

  // ── ThemeData ─────────────────────────────────────────────────────
  static ThemeData get lightTheme {
    final colorScheme = ColorScheme(
      brightness: Brightness.light,
      primary: primary,
      onPrimary: onPrimary,
      primaryContainer: primaryContainer,
      onPrimaryContainer: const Color(0xFFCADCFF),
      secondary: secondary,
      onSecondary: onPrimary,
      secondaryContainer: secondaryContainer,
      onSecondaryContainer: onSecondaryContainer,
      tertiary: tertiary,
      onTertiary: onPrimary,
      tertiaryContainer: tertiaryContainer,
      onTertiaryContainer: const Color(0xFFFFD1BC),
      error: error,
      onError: onError,
      errorContainer: errorContainer,
      onErrorContainer: onErrorContainer,
      surface: surface,
      onSurface: onSurface,
      onSurfaceVariant: onSurfaceVariant,
      outline: outline,
      outlineVariant: outlineVariant,
      inverseSurface: const Color(0xFF2E3036),
      onInverseSurface: const Color(0xFFEFF0F8),
      inversePrimary: const Color(0xFFA8C8FF),
    );

    // Typography: Manrope for headlines, Inter for body/labels
    final textTheme = GoogleFonts.interTextTheme(
      TextTheme(
        displayLarge: GoogleFonts.manrope(
          fontSize: 57,
          fontWeight: FontWeight.w400,
          letterSpacing: -0.02 * 57,
          color: onSurface,
        ),
        displayMedium: GoogleFonts.manrope(
          fontSize: 45,
          fontWeight: FontWeight.w400,
          letterSpacing: -0.02 * 45,
          color: onSurface,
        ),
        displaySmall: GoogleFonts.manrope(
          fontSize: 36,
          fontWeight: FontWeight.w400,
          letterSpacing: -0.02 * 36,
          color: onSurface,
        ),
        headlineLarge: GoogleFonts.manrope(
          fontSize: 32,
          fontWeight: FontWeight.w600,
          letterSpacing: -0.02 * 32,
          color: onSurface,
        ),
        headlineMedium: GoogleFonts.manrope(
          fontSize: 28,
          fontWeight: FontWeight.w600,
          letterSpacing: -0.02 * 28,
          color: onSurface,
        ),
        headlineSmall: GoogleFonts.manrope(
          fontSize: 24,
          fontWeight: FontWeight.w600,
          letterSpacing: -0.02 * 24,
          color: onSurface,
        ),
        titleLarge: GoogleFonts.manrope(
          fontSize: 22,
          fontWeight: FontWeight.w500,
          color: onSurface,
        ),
        titleMedium: GoogleFonts.inter(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.15,
          color: onSurface,
        ),
        titleSmall: GoogleFonts.inter(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.1,
          color: onSurface,
        ),
        bodyLarge: GoogleFonts.inter(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.5,
          color: onSurface,
        ),
        bodyMedium: GoogleFonts.inter(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.25,
          color: onSurface,
        ),
        bodySmall: GoogleFonts.inter(
          fontSize: 12,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.4,
          color: onSurfaceVariant,
        ),
        labelLarge: GoogleFonts.inter(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.1,
          color: onSurface,
        ),
        labelMedium: GoogleFonts.inter(
          fontSize: 12,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.5,
          color: onSurfaceVariant,
        ),
        labelSmall: GoogleFonts.inter(
          fontSize: 11,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.5,
          color: onSurfaceVariant,
        ),
      ),
    );

    return ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,
      textTheme: textTheme,
      scaffoldBackgroundColor: surface,

      // Input fields: no box, tonal background only
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: surfaceContainerHigh,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: const BorderSide(color: primary, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: const BorderSide(color: error, width: 1.5),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: const BorderSide(color: error, width: 2),
        ),
        labelStyle: GoogleFonts.inter(
          fontSize: 12,
          fontWeight: FontWeight.w500,
          color: onSurfaceVariant,
        ),
        hintStyle: GoogleFonts.inter(
          fontSize: 14,
          color: onSurfaceVariant,
        ),
        errorStyle: GoogleFonts.inter(
          fontSize: 12,
          color: error,
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 18,
        ),
      ),

      // Elevated button: gradient managed per-widget via DecoratedBox
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primary,
          foregroundColor: onPrimary,
          minimumSize: const Size(double.infinity, 52),
          shape: const StadiumBorder(),
          elevation: 0,
          textStyle: GoogleFonts.inter(
            fontSize: 15,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.1,
          ),
        ),
      ),

      // Text button
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: primary,
          textStyle: GoogleFonts.inter(
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),

      // App bar
      appBarTheme: AppBarTheme(
        backgroundColor: surface,
        elevation: 0,
        scrolledUnderElevation: 1,
        titleTextStyle: GoogleFonts.manrope(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: onSurface,
        ),
        iconTheme: const IconThemeData(color: onSurface),
      ),

      // Bottom nav bar
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: surfaceContainerLowest,
        selectedItemColor: primary,
        unselectedItemColor: onSurfaceVariant,
        type: BottomNavigationBarType.fixed,
        elevation: 8,
      ),
    );
  }
}
