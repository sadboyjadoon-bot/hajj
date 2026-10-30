import 'package:go_router/go_router.dart';

import '../../screens/app_shell.dart';
import '../../screens/screens.dart';

abstract final class AppRoutes {
  static const home = '/home';
  static const routine = '/routine';
  static const prayers = '/prayers';
  static const duas = '/duas';
  static const checklist = '/checklist';
  static const settings = '/settings';
  static const packing = '/packing';
  static const guide = '/guide';

  static String ritual(int day) => '/ritual/$day';
}

GoRouter createAppRouter() => GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(path: '/', builder: (context, state) => const SplashScreen()),
    GoRoute(
      path: '/onboarding',
      builder: (context, state) => const OnboardingScreen(),
    ),
    ShellRoute(
      builder: (context, state, child) =>
          AppShell(location: state.uri.path, child: child),
      routes: [
        GoRoute(
          path: AppRoutes.home,
          builder: (context, state) => const HomeScreen(),
        ),
        GoRoute(
          path: AppRoutes.routine,
          builder: (context, state) => const RoutineScreen(),
        ),
        GoRoute(
          path: AppRoutes.prayers,
          builder: (context, state) => const PrayerScreen(),
        ),
        GoRoute(
          path: AppRoutes.duas,
          builder: (context, state) => const DuaScreen(),
        ),
        GoRoute(
          path: AppRoutes.checklist,
          builder: (context, state) => const ChecklistScreen(),
        ),
        GoRoute(
          path: AppRoutes.settings,
          builder: (context, state) => const SettingsScreen(),
        ),
        GoRoute(
          path: AppRoutes.packing,
          builder: (context, state) => const PackingScreen(),
        ),
        GoRoute(
          path: AppRoutes.guide,
          builder: (context, state) => const GuideScreen(),
        ),
        GoRoute(
          path: '/ritual/:day',
          builder: (context, state) {
            final day = int.tryParse(state.pathParameters['day'] ?? '');
            if (day == null || day < 8 || day > 13) {
              return const GuideScreen();
            }
            return RitualDetailScreen(day: day);
          },
        ),
      ],
    ),
  ],
);
