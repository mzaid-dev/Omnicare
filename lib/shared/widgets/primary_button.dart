import 'package:flutter/material.dart';
import 'package:omnicare/app/theme/app_colors.dart';
import 'package:omnicare/app/theme/text_styles.dart';

class PrimaryButton extends StatefulWidget {
  final String text;
  final VoidCallback onTap;
  final double? width;
  final double height;
  final Color backgroundColor;
  final Color textColor;

  const PrimaryButton({
    super.key,
    required this.text,
    required this.onTap,
    this.width = double.infinity,
    this.height = 65,
    this.backgroundColor = AppColors.primary,
    this.textColor = Colors.white,
  });

  @override
  State<PrimaryButton> createState() => _PrimaryButtonState();
}

class _PrimaryButtonState extends State<PrimaryButton> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => setState(() => _isPressed = true),
      onTapUp: (_) => setState(() => _isPressed = false),
      onTapCancel: () => setState(() => _isPressed = false),
      onTap: widget.onTap,
      child: AnimatedScale(
        scale: _isPressed ? 0.96 : 1.0,
        duration: const Duration(milliseconds: 100),
        curve: Curves.easeOutCubic,
        child: Container(
          width: widget.width,
          height: widget.height,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                widget.backgroundColor,
                widget.backgroundColor.withBlue(
                  (widget.backgroundColor.blue + 20).clamp(0, 255),
                ).withRed(
                  (widget.backgroundColor.red - 20).clamp(0, 255),
                ),
              ],
            ),
            borderRadius: BorderRadius.circular(24),
            border: Border.all(
              color: Colors.white.withOpacity(0.12),
              width: 1,
            ),
            boxShadow: [
              BoxShadow(
                color: widget.backgroundColor.withOpacity(0.35),
                blurRadius: 25,
                offset: const Offset(0, 12),
                spreadRadius: -4,
              ),
            ],
          ),
          child: Center(
            child: Text(
              widget.text,
              style: AppTextStyles.buttonText.copyWith(
                color: widget.textColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
