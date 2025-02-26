import 'package:flutter/material.dart';

class XColors {
  XColors._();

  // App Basic Colors
  static const Color primary = Color(0xFF2292D2);
  static const Color secondary = Color(0xFFE7E7E7);
  static const Color accent = Color(0xFF9C9C9C);
  static const Color xgreen = Color(0xFF00AE8E);
  static const Color xyellow = Color(0xFFFAA635);
  static const Color xpurple = Color(0xFFA13F97);
  static const Color xgrey = Color(0xFF585858);

  // Text Colors
  static const Color textPrimary = Color(0xFF2292D2);
  static const Color textSecondary = Color(0xFF585858);
  static const Color textWhite = Colors.white;

  // Background Colors
  static const Color light = Color(0xFFE7E7E7);
  static const Color dark = Color(0xFF585858);
  static const Color primaryBackground = Colors.white;

  // Background Container Colors
  static const Color lightContainer = Color(0xFFE7E7E7);
  static const Color darkContainer = Color(0xFF585858);

  // Button Colors
  static const Color buttonPrimary = Color(0xFF2292D2);
  static const Color buttonSecondary = Color(0xFF585858);
  static const Color buttonDisabled = Colors.white;

  // Gradient Colors
  static const Gradient linearGradient = LinearGradient(
      begin: Alignment(0.0, 0.0),
      end: Alignment(0.707, -0.707),
      colors: [
        Color(0xFF2292D2),
        Color(0xFF9F9F9F),
      ]);

  // Border colors
  static const Color borderPrimary = Color(0xFFD9D9D9);
  static const Color borderSecondary = Color(0xFFE6E6E6);

  // Error and validation colors
  static const Color error = Color(0xFFD32F2F);
  static const Color success = Color(0xFF388E3C);
  static const Color warning = Color(0xFFF57C00);
  static const Color info = Color(0xFF1976D2);

  // Neutral Shades
  static const Color black = Color(0xFF232323);
  static const Color darkerGrey = Color(0xFF4F4F4F);
  static const Color darkGrey = Color(0xFF939393);
  static const Color grey = Color(0xFFE0E0E0);
  static const Color softGrey = Color(0xFFF4F4F4);
  static const Color lightGrey = Color(0xFFF9F9F9);
  static const Color white = Color(0xFFFFFFFF);
}
