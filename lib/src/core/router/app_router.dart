
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:submission_bmi/src/core/router/app_route_constant.dart';
import 'package:submission_bmi/src/features/main_screen.dart';
import 'package:submission_bmi/src/features/splash/splash_screen.dart';
import 'package:submission_bmi/src/features/walkthrough/walkthrough_screen.dart';

class AppRouter {
  AppRouter();

  GoRouter router() => GoRouter(
      initialLocation: AppRoute.splashScreen.path,
      routes: <RouteBase>[
          GoRoute(
            path:AppRoute.splashScreen.path,
            name: AppRoute.splashScreen.name,
            builder: (context , state) {
              return const  SplashScreen();
              }
          ),
          GoRoute(
            path: AppRoute.mainScreen.path,
            name: AppRoute.mainScreen.name,
            pageBuilder: (context, state) => CustomTransitionPage<void>(
              key: state.pageKey,
              child: const MainScreen(),
              transitionsBuilder: (context, animation, secondaryAnimation, child) =>
                  ScaleTransition(scale: animation,
                  child: child),
            ),
          ),
        GoRoute(
            path: AppRoute.walkthroughScreen.path,
            name: AppRoute.walkthroughScreen.name,
            redirect: (context,state) async {
              final prefs = await SharedPreferences.getInstance();
              bool? firstRun = prefs.getBool('first_run');

              if (firstRun != null) {
                return AppRoute.mainScreen.path;
              } else {
                return AppRoute.walkthroughScreen.path;
              }

            },
            builder: (context , state) {
              return const WalkthroughScreen();
            }
        ),
      ]);
}