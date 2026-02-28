import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:omnicare/app/theme/app_colors.dart';

class CustomBarChart extends StatelessWidget {
  final List<double> dataPoints;
  final Color barColor;

  const CustomBarChart({
    super.key,
    required this.dataPoints,
    this.barColor = AppColors.secondary,
  });

  @override
  Widget build(BuildContext context) {
    return BarChart(
      BarChartData(
        gridData: const FlGridData(show: false),
        titlesData: const FlTitlesData(show: false),
        borderData: FlBorderData(show: false),
        barGroups: dataPoints.asMap().entries.map((entry) {
          return BarChartGroupData(
            x: entry.key,
            barRods: [
              BarChartRodData(
                toY: entry.value,
                color: barColor.withOpacity(0.8),
                width: 14, // Nice and thick like the design
                borderRadius: BorderRadius.circular(6), // Rounded caps
              ),
            ],
          );
        }).toList(),
      ),
      duration: const Duration(milliseconds: 500), // Smooth morphing
      curve: Curves.easeInOut,
    );
  }
}