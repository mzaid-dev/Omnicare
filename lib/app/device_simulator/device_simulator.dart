import 'package:flutter/material.dart';
import 'package:omnicare/app/device_simulator/widgets/simulator_header.dart';

class DeviceSimulatorFrame extends StatelessWidget {
  final Widget child;
  const DeviceSimulatorFrame({super.key, required this.child});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
      Colors.transparent,
      body: Overlay(
        initialEntries: [
          OverlayEntry(
            builder: (context) => Column(
              children: [
                const SizedBox(height: 10),
                const SimulatorHeader(),
                const SizedBox(height: 10),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.5),
                          blurRadius: 40,
                          spreadRadius: 2,
                          offset: const Offset(0, 20),
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(40),
                      child: child,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
        ],
      ),
    );
  }
}