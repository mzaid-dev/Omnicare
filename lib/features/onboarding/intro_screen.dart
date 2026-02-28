import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:omnicare/app/router/routes.dart';
import 'package:omnicare/app/theme/text_styles.dart';
import 'package:omnicare/core/assets.dart';
import 'package:omnicare/shared/widgets/primary_button.dart';

import '../../core/constants/hero_tags.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        bottom: false,
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            final double value = _controller.value;
            final double slide = 12 * value;
            
            return Stack(
              fit: StackFit.expand,
              clipBehavior: Clip.none,
              children: [
                Positioned(
                  top: -10 + slide,
                  left: -75 - (slide * 0.5),
                  child: Transform.rotate(
                    angle: -0.3 + (0.05 * value),
                    child: Image.asset(
                      AppAssets.coloredBrain,
                      width: 240,
                      height: 240,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                Positioned(
                  top: 20 - slide,
                  right: -95 + (slide * 0.4),
                  child: Transform.rotate(
                    angle: 0.18 - (0.04 * value),
                    child: Hero(
                      tag: '${AppHeroTags.lungsTag}_2',
                      child: Image.asset(
                        AppAssets.coloredLungs,
                        width: 270,
                        height: 270,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 120 + slide,
                  left: -80 + (slide * 0.3),
                  child: Transform.rotate(
                    angle: 0.01 + (0.06 * value),
                    child: Image.asset(
                      AppAssets.coloredHeart,
                      width: 246,
                      height: 246,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 150 - slide,
                  right: -65 - (slide * 0.2),
                  child: Transform.rotate(
                    angle: -0.3 - (0.05 * value),
                    child: Image.asset(
                      AppAssets.coloredKidney,
                      width: 220,
                      height: 220,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                Positioned(
                  left: 0,
                  right: 20 + slide,
                  bottom: -20 - (slide * 0.8),
                  child: Transform.rotate(
                    angle: 0.05 + (0.03 * value),
                    child: Image.asset(
                      AppAssets.coloredStomach,
                      width: 240,
                      height: 240,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text.rich(
                      textAlign: TextAlign.center,
                      TextSpan(
                        text: 'All-in-one\n',
                        style: AppTextStyles.heading1.copyWith(height: 1.15),
                        children: const [TextSpan(text: 'healthcare app')],
                      ),
                    ),
                    const SizedBox(height: 30),
                    PrimaryButton(
                      text: "Get Started",
                      width: 200,
                      onTap: () => context.go(AppRoutes.homePath),
                    ),
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
