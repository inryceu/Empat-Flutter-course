import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../Pages/home_page.dart';
import '../Pages/history_page.dart';
import '../Pages/ready_pizzas_page.dart';
import '../Pages/pizza_details_page.dart';
import '../Components/scaffold_with_nav_bar.dart';

import '../Domain/pizza.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorCreateKey = GlobalKey<NavigatorState>(
  debugLabel: 'create',
);
final _shellNavigatorHistoryKey = GlobalKey<NavigatorState>(
  debugLabel: 'history',
);
final _shellNavigatorReadyKey = GlobalKey<NavigatorState>(debugLabel: 'ready');

final goRouter = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: '/create',
  routes: [
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return ScaffoldWithNavBar(navigationShell: navigationShell);
      },
      branches: [
        StatefulShellBranch(
          navigatorKey: _shellNavigatorCreateKey,
          routes: [
            GoRoute(
              path: '/create',
              builder: (context, state) => const HomePage(),
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _shellNavigatorHistoryKey,
          routes: [
            GoRoute(
              path: '/history',
              builder: (context, state) => const HistoryPage(),
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _shellNavigatorReadyKey,
          routes: [
            GoRoute(
              path: '/ready',
              builder: (context, state) => const ReadyPizzasPage(),
              routes: [
                GoRoute(
                  name: 'pizza_details',
                  path: 'details',
                  parentNavigatorKey: _rootNavigatorKey,
                  builder: (context, state) {
                    final pizza = state.extra as Pizza;
                    return PizzaDetailsPage(pizza: pizza);
                  },
                ),
              ],
            ),
          ],
        ),
      ],
    ),
  ],
);
