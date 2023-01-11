

import 'package:go_router/go_router.dart';
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
              path: AppRoute.mainScreen.path,
              name: AppRoute.mainScreen.name,
              redirect: (context ,state) {
                return AppRoute.mainScreen.path;
              },
          ),
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
            builder: (context , state) {
              return const MainScreen();
            }
          ),
        GoRoute(
            path: AppRoute.walkthroughScreen.path,
            name: AppRoute.walkthroughScreen.name,
            builder: (context , state) {
              return const WalkthroughScreen();
            }
        ),
      ]);
}