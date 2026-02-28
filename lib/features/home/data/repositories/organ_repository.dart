import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:omnicare/app/theme/app_colors.dart';
import 'package:omnicare/core/assets.dart';
import '../models/organ_model.dart';

class OrganRepository {
  static const List<OrganModel> allOrgans = [

    OrganModel(
      name: "Brain",
      coloredAsset: AppAssets.coloredBrain,
      greyAsset: AppAssets.greyBrain,
      accent: AppColors.organBrain,
      card1Icon: Icons.psychology_outlined,
      card2Icon: Icons.bedtime_outlined,
      card3Icon: Icons.psychology_outlined,
      card1Title: "Cognitive Focus",
      card1Value: "85%",
      card1Data: [
        FlSpot(0, 32), FlSpot(1, 41), FlSpot(2, 38),
        FlSpot(3, 55), FlSpot(4, 63), FlSpot(5, 72),
        FlSpot(6, 78), FlSpot(7, 85),
      ],
      card2Title: "Sleep Quality",
      card2Value: "7h 30m",
      card2Data: [5.5, 6.0, 7.5, 6.5, 8.0, 7.0, 7.5],
      card3Title: "Focus Drops",
      card3Value: "Low",
      card3Data: [5, 3, 6, 2, 4, 3, 2],
    ),

    OrganModel(
      name: "Heart",
      coloredAsset: AppAssets.coloredHeart,
      greyAsset: AppAssets.greyHeart,
      accent: AppColors.organHeart,
      card1Icon: Icons.favorite_border,
      card2Icon: Icons.favorite_border,
      card3Icon: Icons.monitor_heart_outlined,
      card1Title: "Heart Rate",
      card1Value: "72 BPM",
      card1Data: [
        FlSpot(0, 63), FlSpot(1, 68), FlSpot(2, 72),
        FlSpot(3, 118), FlSpot(4, 95), FlSpot(5, 80),
        FlSpot(6, 72), FlSpot(7, 68),
      ],
      card2Title: "Blood Pressure",
      card2Value: "120 / 80",
      card2Data: [122, 118, 125, 115, 120, 117, 121],
      card3Title: "HRV Score",
      card3Value: "60 ms",
      card3Data: [4.0, 5.5, 4.5, 7.0, 6.0, 7.5, 6.5],
    ),

    OrganModel(
      name: "Lungs",
      coloredAsset: AppAssets.coloredLungs,
      greyAsset: AppAssets.greyLungs,
      accent: AppColors.organLungs,
      card1Icon: Icons.air,
      card2Icon: Icons.air,
      card3Icon: Icons.nights_stay_outlined,
      card1Title: "Oxygen Saturation",
      card1Value: "97%",
      card1Data: [
        FlSpot(0, 94), FlSpot(1, 97), FlSpot(2, 95),
        FlSpot(3, 98), FlSpot(4, 96), FlSpot(5, 99),
        FlSpot(6, 97), FlSpot(7, 98),
      ],
      card2Title: "Breathing Rate",
      card2Value: "14 bpm",
      card2Data: [16, 14, 15, 13, 14, 15, 14],
      card3Title: "Sleep Events",
      card3Value: "Low  2/hr",
      card3Data: [3, 2, 4, 1, 2, 3, 2],
    ),

    OrganModel(
      name: "Kidneys",
      coloredAsset: AppAssets.coloredKidney,
      greyAsset: AppAssets.greyKidney,
      accent: AppColors.organKidneys,
      card1Icon: Icons.water_drop_outlined,
      card2Icon: Icons.local_drink_outlined,
      card3Icon: Icons.water_drop_outlined,
      card1Title: "Sodium Balance",
      card1Value: "139 mmol/L",
      card1Data: [
        FlSpot(0, 136), FlSpot(1, 138), FlSpot(2, 137),
        FlSpot(3, 140), FlSpot(4, 138), FlSpot(5, 141),
        FlSpot(6, 139), FlSpot(7, 140),
      ],
      card2Title: "Fluid Output",
      card2Value: "1.7 L / day",
      card2Data: [1.4, 1.8, 1.6, 2.1, 1.7, 1.9, 1.6],
      card3Title: "Hydration Goal",
      card3Value: "8 / 10",
      card3Data: [6, 7, 8, 10, 8, 9, 8],
    ),

    OrganModel(
      name: "Stomach",
      coloredAsset: AppAssets.coloredStomach,
      greyAsset: AppAssets.greyStomach,
      accent: AppColors.organStomach,
      card1Icon: Icons.restaurant_outlined,
      card2Icon: Icons.local_fire_department_outlined,
      card3Icon: Icons.health_and_safety_outlined,
      card1Title: "Hydration Level",
      card1Value: "2.5 L",
      card1Data: [
        FlSpot(0, 0.3), FlSpot(1, 0.8), FlSpot(2, 1.2),
        FlSpot(3, 1.6), FlSpot(4, 2.0), FlSpot(5, 2.3),
        FlSpot(6, 2.4), FlSpot(7, 2.5),
      ],
      card2Title: "Caloric Intake",
      card2Value: "2,100 kcal",
      card2Data: [1850, 2200, 1950, 2350, 2100, 2000, 2150],
      card3Title: "Digestion Index",
      card3Value: "9 / 10",
      card3Data: [7, 8, 9, 10, 8, 9, 9],
    ),
  ];
}