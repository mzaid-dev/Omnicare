import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:omnicare/app/theme/app_colors.dart';

class TrackedBarChart extends StatelessWidget {
  final List<double> dataPoints;
  final double maxY;
  final Color barColor;

  const TrackedBarChart({
    super.key,
    required this.dataPoints,
    this.maxY = 10.0,
    this.barColor = AppColors.chartBar,
  });

  @override
  Widget build(BuildContext context) {
    return BarChart(
      BarChartData(
        maxY: maxY,
        gridData: const FlGridData(show: false),
        titlesData: const FlTitlesData(show: false),
        borderData: FlBorderData(show: false),
        barGroups: dataPoints.asMap().entries.map((entry) {
          return BarChartGroupData(
            x: entry.key,
            barRods: [
              BarChartRodData(
                toY: entry.value,
                color: barColor,
                width: 10,
                borderRadius: BorderRadius.circular(20),
                backDrawRodData: BackgroundBarChartRodData(
                  show: true,
                  toY: maxY,
                  color: AppColors.chartTrack,
                ),
              ),
            ],
          );
        }).toList(),
      ),
      duration: const Duration(milliseconds: 600),
      curve: Curves.easeOutQuart,
    );
  }
}