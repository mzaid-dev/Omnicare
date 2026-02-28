import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class CustomLineChart extends StatelessWidget {
  final List<FlSpot> spots;
  final Color lineColor;

  const CustomLineChart({
    super.key,
    required this.spots,
    this.lineColor = const Color(0xFF4A90E2),
  });

  @override
  Widget build(BuildContext context) {
    if (spots.isEmpty) return const SizedBox.shrink();

    final double minX = spots.first.x;
    final double maxX = spots.last.x;
    final double minY = spots.map((s) => s.y).reduce((a, b) => a < b ? a : b);
    final double maxY = spots.map((s) => s.y).reduce((a, b) => a > b ? a : b);
    final double yRange = (maxY - minY).clamp(1.0, double.infinity);
    final double yPad = yRange * 0.20;

    return LineChart(
      LineChartData(
        minX: minX - 0.4,
        maxX: maxX + 0.4,
        minY: minY - yPad,
        maxY: maxY + yPad,

        gridData: const FlGridData(show: false),
        titlesData: const FlTitlesData(show: false),
        borderData: FlBorderData(show: false),
        clipData: const FlClipData.all(),
        lineBarsData: [
          LineChartBarData(
            spots: spots,
            isCurved: true,
            curveSmoothness: 0.35,
            preventCurveOverShooting: true,
            color: lineColor,
            barWidth: 3.5,
            isStrokeCapRound: true,
            dotData: const FlDotData(show: false),
            belowBarData: BarAreaData(
              show: true,
              gradient: LinearGradient(
                colors: [
                  lineColor.withOpacity(0.28),
                  lineColor.withOpacity(0.0),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
        ],
      ),
      duration: const Duration(milliseconds: 650),
      curve: Curves.easeOutQuart,
    );
  }
}
