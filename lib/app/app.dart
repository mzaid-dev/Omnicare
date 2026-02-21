import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:device_frame/device_frame.dart';
import 'package:omnicare/app/router/app_router.dart';
import 'package:omnicare/app/theme/app_theme.dart';
import 'device_simulator/device_simulator.dart';

class OmnicareApp extends StatelessWidget {
  const OmnicareApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Omnicare',
      theme: AppTheme.lightTheme,
      routerConfig: router,
      builder: (context, child) {
        if (child == null) return const SizedBox.shrink();

        if (!kIsWeb && defaultTargetPlatform == TargetPlatform.android) {
          return child;
        }
        final deviceFrame = DeviceFrame(
          device: Devices.ios.iPhone13ProMax,
          isFrameVisible: true,
          orientation: Orientation.portrait,
          screen: child,
        );
        if (!kIsWeb && (defaultTargetPlatform == TargetPlatform.windows)) {
          return DeviceSimulatorFrame(child: deviceFrame);
        }
        return deviceFrame;
      },
    );
  }
}