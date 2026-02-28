import 'package:flutter/material.dart';
import 'package:omnicare/app/theme/app_colors.dart';
import 'package:omnicare/core/assets.dart';

class CustomBottomNav extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemSelected;

  const CustomBottomNav({
    super.key,
    required this.selectedIndex,
    required this.onItemSelected,
  });

  static const int _itemCount = 3;
  static const double _pillSize = 52.0;
  static const double _iconSize = 22.0;
  static const double _vPad = 10.0;

  static const List<String> _icons = [
    AppAssets.appointmentIcon,
    AppAssets.homeIcon,
    AppAssets.personIcon,
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10, left: 40, right: 40),
      padding: const EdgeInsets.symmetric(vertical: _vPad),
      decoration: AppColors.commonDecoration(
        borderRadius: 28,
        showShadow: true,
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final double totalWidth = constraints.maxWidth;
          final double step = totalWidth / _itemCount;
          final double pillLeft =
              selectedIndex * step + (step - _pillSize) / 2;

          return SizedBox(
            height: _pillSize,
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                AnimatedPositioned(
                  duration: const Duration(milliseconds: 400),
                  curve: Curves.easeOutBack,
                  left: pillLeft,
                  top: 0,
                  child: Container(
                    width: _pillSize,
                    height: _pillSize,
                    decoration: BoxDecoration(
                      color: AppColors.primary,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.primary.withOpacity(0.45),
                          blurRadius: 20,
                          offset: const Offset(0, 7),
                          spreadRadius: -4,
                        ),
                      ],
                    ),
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.white.withOpacity(0.18),
                            Colors.transparent,
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Row(
                  children: List.generate(_itemCount, (index) {
                    final bool isSelected = selectedIndex == index;
                    return Expanded(
                      child: GestureDetector(
                        onTap: () => onItemSelected(index),
                        behavior: HitTestBehavior.opaque,
                        child: SizedBox(
                          height: _pillSize,
                          child: Center(
                            child: AnimatedScale(
                              scale: isSelected ? 1.1 : 1.0,
                              duration: const Duration(milliseconds: 350),
                              curve: Curves.easeOutBack,
                              child: Image.asset(
                                _icons[index],
                                width: _iconSize,
                                height: _iconSize,
                                color: isSelected
                                    ? Colors.white
                                    : const Color(0xFFB0BEC5),
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}