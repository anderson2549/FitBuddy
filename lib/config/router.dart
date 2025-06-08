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
      /*routes: <RouteBase>[
        GoRoute(
          path: 'details',
          builder: (BuildContext context, GoRouterState state) {
            return const DetailsScreen();
          },
        ),

        {
        "/buttons":(context)=> ButtonsScreen(),
        "/cards":(context)=> CardsScreen(),
      }
      ],*/
    ),
    GoRoute(
      path: "/buttons",
      builder: (context, state) => ButtonsScreen(),
      name: ButtonsScreen.name,
    ),
    GoRoute(
      path: "/cards",
      builder: (context, state) => CardsScreen(),
      name: CardsScreen.name,
    ),
    GoRoute(
      path: "/progress",
      builder: (context, state) => ProgressScreen(),
      name: ProgressScreen.name,
    ),
    GoRoute(
      path: "/snackbars",
      builder: (context, state) => SnackbarScreen(),
      name: SnackbarScreen.name,
    ),
    GoRoute(
      path: "/animation",
      builder: (context, state) => AnimatedScreen(),
      name: AnimatedScreen.name,
    ),
    GoRoute(
      path: "/uicontrols",
      builder: (context, state) => UiConstrolsScreen(),
      name: UiConstrolsScreen.name,
    ),
    GoRoute(
      path: "/tutorial",
      builder: (context, state) => AppTutorialScreen(),
      name: AppTutorialScreen.name,
    ),
    GoRoute(
      path: "/homescreen",
      builder: (context, state) => RegisterScreen(),
      name: RegisterScreen.name,
    ),
    GoRoute(
      path: "/scroll",
      builder: (context, state) => InfiniteScrollScreen(),
      name: InfiniteScrollScreen.name,
    ),
    GoRoute(
      path: "/controltheme",
      builder: (context, state) => ThemeChanger(),
      name: ThemeChanger.name,
    ),
  ],
);
