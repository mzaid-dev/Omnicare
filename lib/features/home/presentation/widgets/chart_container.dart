import 'package:flutter/material.dart';
import 'package:omnicare/app/theme/app_colors.dart';
import 'package:omnicare/app/theme/text_styles.dart';
import 'package:omnicare/features/home/data/repositories/organ_repository.dart';
import 'package:omnicare/features/home/presentation/widgets/custom_line_chart.dart';

class ChartContainer extends StatelessWidget {
  final int selectedOrganIndex;

  const ChartContainer({super.key, required this.selectedOrganIndex});

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 550),
      transitionBuilder: (child, animation) {
        final scale = Tween<double>(begin: 0.82, end: 1.0).animate(
          CurvedAnimation(parent: animation, curve: Curves.elasticOut),
        );
        return FadeTransition(
          opacity: CurvedAnimation(parent: animation, curve: Curves.easeOutQuart),
          child: ScaleTransition(scale: scale, child: child),
        );
      },
      child: _ChartCard(
        key: ValueKey<int>(selectedOrganIndex),
        organIndex: selectedOrganIndex,
      ),
    );
  }
}

class _ChartCard extends StatelessWidget {
  final int organIndex;

  const _ChartCard({super.key, required this.organIndex});

  @override
  Widget build(BuildContext context) {
    final organ = OrganRepository.allOrgans[organIndex];
    final Color accent = organ.accent;

    return Container(
      width: double.infinity,
      height: 130,
      decoration: AppColors.commonDecoration(borderRadius: 24),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(24),
        child: Stack(
          children: [
            Positioned.fill(
              child: CustomLineChart(spots: organ.card1Data, lineColor: accent),
            ),
            Positioned(
              top: 16,
              left: 16,
              right: 80,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    padding: const EdgeInsets.all(7),
                    decoration: BoxDecoration(
                      color: accent.withOpacity(0.12),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Icon(organ.card1Icon, size: 15, color: accent),
                  ),
                  const SizedBox(width: 8),
                  Flexible(
                    child: Text(
                      organ.card1Title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: AppTextStyles.cardTitle.copyWith(fontSize: 13),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 14,
              right: 16,
              child: Text(
                organ.card1Value,
                style: AppTextStyles.cardValue.copyWith(fontSize: 28),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
