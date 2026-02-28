import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:omnicare/app/router/routes.dart';
import 'package:omnicare/app/theme/text_styles.dart';
import 'package:omnicare/core/assets.dart';
import 'package:omnicare/shared/widgets/primary_button.dart';

import '../../core/constants/hero_tags.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        bottom: false,
        child: Stack(
          fit: StackFit.expand,
          clipBehavior: Clip.none,
          children: [
            Positioned(
              top: 0,
              left: -75,
              child: Transform.rotate(
                angle: -0.3,
                child: Image.asset(
                  AppAssets.coloredBrain,
                  width: 240,
                  height: 240,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Positioned(
              top: 20,
              right: -95,
              child: Transform.rotate(
                angle: 0.18,
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
              bottom: 120,
              left: -80,
              child: Transform.rotate(
                angle: 0.01,
                child: Image.asset(
                  AppAssets.coloredHeart,
                  width: 246,
                  height: 246,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Positioned(
              bottom: 150,
              right: -65,
              child: Transform.rotate(
                angle: -0.3,
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
              right: 20,
              bottom: -20,
              child: Transform.rotate(
                angle: 0.05,
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
                  textAlign: .center,

                  TextSpan(
                    text: 'All-in-one\n',
                    style: AppTextStyles.heading1.copyWith(height: 1.15),
                    children: <TextSpan>[TextSpan(text: 'healthcare app')],
                  ),
                ),
                const SizedBox(height: 30),
                PrimaryButton(
                  text: "Get Started",
                  width: 200, // Explicit width for intro
                  onTap: () => context.go(AppRoutes.homePath),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
