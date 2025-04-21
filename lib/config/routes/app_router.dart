import 'package:flutter_clean_app/features/settings/presentation/screen/setting_screen.dart';
import 'package:flutter_clean_app/features/counter/presentation/screen/counter_screen.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: '/counter',
    routes: [
      GoRoute(
        path: '/counter',
        name: 'counter',
        builder: (context, state) => const CounterScreen(),
      ),
      GoRoute(
        path: '/settings',
        name: 'settings',
        builder: (context, state) => const SettingsScreen(),
      ),
    ],
  );
}
