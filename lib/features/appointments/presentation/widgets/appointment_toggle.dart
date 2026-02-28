import 'package:flutter/material.dart';
import 'package:omnicare/app/theme/app_colors.dart';
import 'package:omnicare/app/theme/text_styles.dart';

class AppointmentToggle extends StatelessWidget {
  final bool isBookSelected;
  final VoidCallback onToggle;

  const AppointmentToggle({
    super.key,
    required this.isBookSelected,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: AppColors.commonDecoration(borderRadius: 30),
      child: Row(
        children: [
          Expanded(
            child: _buildToggleButton("Book a doctor", isBookSelected, onToggle),
          ),
          Expanded(
            child: _buildToggleButton("Upcoming", !isBookSelected, onToggle),
          ),
        ],
      ),
    );
  }

  Widget _buildToggleButton(String label, bool isSelected, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: isSelected ? Colors.black : Colors.transparent,
          borderRadius: BorderRadius.circular(25),
        ),
        child: Center(
          child: Text(
            label,
            style: AppTextStyles.subtitle.copyWith(
              fontSize: 15,
              fontWeight: FontWeight.w500,
              color: isSelected ? Colors.white : Colors.black54,
            ),
          ),
        ),
      ),
    );
  }
}
