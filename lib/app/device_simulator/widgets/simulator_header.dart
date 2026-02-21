
import 'package:flutter/material.dart';
import 'package:window_manager/window_manager.dart';
import 'frame_controls.dart';


class SimulatorHeader extends StatelessWidget {
  const SimulatorHeader({super.key});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanStart: (_) {
        windowManager.startDragging();
      },
      child: Container(
        height: 52,
        margin: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          color: const Color(0xFF2D2D2D),
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.3),
              blurRadius: 15,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            children: [
              const MacWindowControls(),
              Expanded(
                child: Center(
                  child: Text(
                    "iPhone 13 Pro Max - iOS 15.0",
                    style: TextStyle(
                      color: Colors.grey[400],
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Poppins',
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 68,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
