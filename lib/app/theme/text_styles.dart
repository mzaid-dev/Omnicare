import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyles {
  AppTextStyles._();

  static const Color darkText = Color(0xFF1A1C1E);
  static const Color greyText = Color(0xFF6C727A);
  static const Color secondaryText = Color(0xFF94A3B8);
  static const Color blueText = Color(0xFF3B82F6);

  static TextStyle heading1 = GoogleFonts.outfit(
    fontSize: 42,
    fontWeight: FontWeight.w500,
    color: darkText,
    letterSpacing: -1.2,
    height: 1.1,
  );

  static TextStyle heading2 = GoogleFonts.outfit(
    fontSize: 26,
    fontWeight: FontWeight.w600,
    color: darkText,
    letterSpacing: -0.6,
    height: 1.2,
  );

  static TextStyle heading3 = GoogleFonts.outfit(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: darkText,
    letterSpacing: -0.4,
  );

  static TextStyle massiveStat = GoogleFonts.outfit(
    fontSize: 38,
    fontWeight: FontWeight.w700,
    color: darkText,
    letterSpacing: -1.4,
    height: 1.0,
  );

  static TextStyle subtitle = GoogleFonts.outfit(
    fontSize: 15,
    fontWeight: FontWeight.w400,
    color: greyText,
    letterSpacing: 0.1,
    height: 1.5,
  );

  static TextStyle bodyText = GoogleFonts.outfit(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: greyText,
    height: 1.6,
  );

  static TextStyle cardTitle = GoogleFonts.outfit(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: darkText,
    letterSpacing: 0.2,
  );

  static TextStyle buttonText = GoogleFonts.outfit(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: Colors.white,
    letterSpacing: 0.5,
  );

  static TextStyle doctorName = GoogleFonts.outfit(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: darkText,
    letterSpacing: -0.2,
  );

  static TextStyle doctorRating = GoogleFonts.outfit(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: darkText,
  );

  static TextStyle doctorSpecialty = GoogleFonts.outfit(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: greyText,
  );

  static TextStyle slotHeader = GoogleFonts.outfit(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: darkText,
    letterSpacing: -0.4,
  );

  static TextStyle slotDay = GoogleFonts.outfit(
    fontSize: 13,
    fontWeight: FontWeight.w500,
    color: greyText,
  );

  static TextStyle slotDate = GoogleFonts.outfit(
    fontSize: 18,
    fontWeight: FontWeight.w700,
    color: darkText,
  );

  static TextStyle slotTime = GoogleFonts.outfit(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: darkText,
  );

  static TextStyle cardValue = GoogleFonts.outfit(
    fontSize: 24,
    fontWeight: FontWeight.w700,
    color: darkText,
    height: 1.0,
  );

  static TextStyle cardSubtitle = GoogleFonts.outfit(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: greyText,
  );
}