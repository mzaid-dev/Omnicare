import 'package:flutter/material.dart';
import 'package:omnicare/app/theme/app_colors.dart';
import 'package:omnicare/app/theme/text_styles.dart';
import 'package:omnicare/features/home/presentation/widgets/custom_bar_chart.dart';
import 'package:omnicare/features/home/presentation/widgets/tracked_bar_chart.dart';

class SmallChartCard extends StatelessWidget {
  final String title;
  final String value;
  final List<double> data;
  final IconData icon;
  final Color accent;
  final bool useTrackedChart;

  const SmallChartCard({
    super.key,
    required this.title,
    required this.value,
    required this.data,
    required this.icon,
    required this.accent,
    this.useTrackedChart = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
      decoration: AppColors.commonDecoration(borderRadius: 24),
      padding: const EdgeInsets.fromLTRB(14, 14, 14, 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: accent.withOpacity(0.12),
                  borderRadius: BorderRadius.circular(9),
                ),
                child: Icon(icon, size: 13, color: accent),
              ),
              const SizedBox(width: 7),
              Expanded(
                child: Text(
                  title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyles.cardTitle.copyWith(
                    fontSize: 13,
                    height: 1.2,
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 6),
              child: useTrackedChart
                  ? TrackedBarChart(dataPoints: data, maxY: _maxY, barColor: accent)
                  : CustomBarChart(dataPoints: data, barColor: accent),
            ),
          ),
          Text(
            value,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: AppTextStyles.cardValue.copyWith(fontSize: 15),
          ),
        ],
      ),
    );
  }

  double get _maxY {
    if (data.isEmpty) return 10;
    final max = data.reduce((a, b) => a > b ? a : b);
    return (max * 1.2).ceilToDouble().clamp(1.0, double.infinity);
  }
}
