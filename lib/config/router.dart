import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:fitbuddy/presentations/importScreen.dart';

/// The route configuration.
final GoRouter appRouter = GoRouter(
  initialLocation: "/",
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      name: HomeScreen.name,
      builder: (BuildContext context, GoRouterState state) {
        return const HomeScreen();
      },
    ),
    GoRoute(
      path: "/uicontrols",
      builder: (context, state) => UiConstrolsScreen(),
      name: UiConstrolsScreen.name,
    ),
    GoRoute(
      path: "/register",
      builder: (context, state) => RegisterScreen(),
      name: RegisterScreen.name,
    ),
    GoRoute(
      path: "/login",
      builder: (context, state) => LoginScreen(),
      name: LoginScreen.name,
    ),
    GoRoute(
      path: "/main",
      builder: (context, state) => MainScreen(),
      name: MainScreen.name,
    ),
  ],
);
