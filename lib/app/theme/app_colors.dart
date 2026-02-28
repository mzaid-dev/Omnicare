import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  static const Color background = Colors.transparent;
  static const Color primary = Color(0xFFFF5252);
  static const Color secondary = Color(0xFF3B82F6);
  static const Color tertiary = Color(0xFF1A1C1E);

  static const Color organBrain   = Color(0xFF8B5CF6);
  static const Color organHeart   = Color(0xFFEF4444);
  static const Color organLungs   = Color(0xFF3B82F6);
  static const Color organKidneys = Color(0xFFF59E0B);
  static const Color organStomach = Color(0xFF10B981);
  static const Color chartBar = Color(0xFF1A1C1E);
  static const Color chartTrack = Color(0xFFE2E8F0);

  static const Color textPrimary = Color(0xFF1A1C1E);
  static const Color success = Color(0xFF10B981);
  static const Color pending = Color(0xFFF59E0B);

  static const LinearGradient linearGradient = LinearGradient(
    begin: Alignment.topRight,
    end: Alignment.bottomLeft,
    colors: [
      Color(0xFFE8F2F9),
      Color(0xFFFDECEF),
    ],
    stops: [0.0, 1.0],
  );

  static BoxDecoration commonDecoration({
    bool showBorder = false,
    bool showShadow = true,
    Color color = Colors.white,
    double borderRadius = 28,
  }) {
    return BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(borderRadius),
      border: showBorder
          ? Border.all(color: const Color(0xFFE2E8F0), width: 1.2)
          : Border.all(color: const Color(0xFF1E293B).withOpacity(0.05), width: 1),
      boxShadow: showShadow
          ? [
              BoxShadow(
                color: const Color(0xFF1E293B).withOpacity(0.06),
                blurRadius: 24,
                offset: const Offset(0, 8),
              ),
              BoxShadow(
                color: const Color(0xFF1E293B).withOpacity(0.02),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ]
          : [],
    );
  }
}