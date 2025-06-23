import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:fitbuddy/presentations/importScreen.dart';
import 'package:fitbuddy/presentations/screens/routine/routine_gifs_screen.dart';

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
    GoRoute(
      path: "/routine-detail",
      builder: (context, state) {
        final routineName = state.uri.queryParameters['name'] ?? 'Rutina';
        final routineKey = state.uri.queryParameters['key'] ?? '';
        return RoutineGifsScreen(
          routineName: routineName,
          routineKey: routineKey,
        );
      },
      name: RoutineGifsScreen.name,
    ),
  ],
);
