import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_multiple_counter_app_screens/change_notifier_provider.dart';
import 'package:riverpod_multiple_counter_app_screens/main.dart';
import 'package:riverpod_multiple_counter_app_screens/state_provider.dart';

import 'state_notifier_provider.dart';

final routeProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const HomePage(),
      ),
      GoRoute(
        path: '/stateProviderScreen',
        builder: (context, state) => const StateProviderScreen(),
      ),
      GoRoute(
        path: '/stateNotifierScreen',
        builder: (context, state) => const StateNotifierScreen(),
      ),
      GoRoute(
        path: '/changeNotifierScreen',
        builder: (context, state) => const ChangeNotifierScreen(),
      ),
    ],
  );
});
