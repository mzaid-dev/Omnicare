import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:omnicare/app/router/routes.dart';
import 'package:omnicare/features/onboarding/intro_screen.dart';

GoRouter router = GoRouter(
  initialLocation: AppRoutes.onboarding,
  routes: [
    GoRoute(
      path: AppRoutes.onboardingPath,
      name: AppRoutes.onboarding,
      builder: (BuildContext context, GoRouterState state) {
        return const IntroScreen();
      },
    ),

  ],
);
