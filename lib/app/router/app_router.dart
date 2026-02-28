import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:omnicare/app/router/routes.dart';
import 'package:omnicare/features/home/presentation/screens/home_screen.dart';
import 'package:omnicare/features/onboarding/intro_screen.dart';


import 'package:omnicare/features/appointments/presentation/screens/appointments_screen.dart';
import 'package:omnicare/features/home/presentation/screens/main_shell.dart';
import 'package:omnicare/features/profile/presentation/screens/profile_screen.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();

GoRouter router = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: AppRoutes.onboardingPath,
  routes: [
    GoRoute(
      path: AppRoutes.onboardingPath,
      name: AppRoutes.onboarding,
      pageBuilder: (context, state) => CustomTransitionPage(
        key: state.pageKey,
        transitionDuration: const Duration(milliseconds: 700),
        reverseTransitionDuration: const Duration(milliseconds: 700),
        child: const IntroScreen(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(opacity: animation, child: child);
        },
      ),
    ),
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return MainShell(navigationShell: navigationShell);
      },
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: AppRoutes.appointmentsPath,
              name: AppRoutes.appointments,
              pageBuilder: (context, state) => CustomTransitionPage(
                key: state.pageKey,
                child: const AppointmentsScreen(),
                transitionsBuilder: (context, animation, secondaryAnimation, child) {
                  return FadeTransition(opacity: animation, child: child);
                },
              ),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: AppRoutes.homePath,
              name: AppRoutes.home,
              pageBuilder: (context, state) => CustomTransitionPage(
                key: state.pageKey,
                child: const HomeScreen(),
                transitionsBuilder: (context, animation, secondaryAnimation, child) {
                  return FadeTransition(opacity: animation, child: child);
                },
              ),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: AppRoutes.profilePath,
              name: AppRoutes.profile,
              pageBuilder: (context, state) => CustomTransitionPage(
                key: state.pageKey,
                child: const ProfileScreen(),
                transitionsBuilder: (context, animation, secondaryAnimation, child) {
                  return FadeTransition(opacity: animation, child: child);
                },
              ),
            ),
          ],
        ),
      ],
    ),
  ],
);

