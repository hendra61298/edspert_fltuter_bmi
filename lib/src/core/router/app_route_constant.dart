enum AppRoute {
  splashScreen,
  walkthroughScreen,
  mainScreen
}

extension AppRouteExtension on AppRoute{
  String get name {
    switch (this){
      case AppRoute.splashScreen:
        return 'Splash Screen';
      case AppRoute.walkthroughScreen:
        return 'Walkthrough Screen';
      case AppRoute.mainScreen:
        return 'Main Screen';
    }
  }

  String get path {
    switch (this) {
      case AppRoute.splashScreen:
        return '/splash';
      case AppRoute.walkthroughScreen:
        return '/walkthrough';
      case AppRoute.mainScreen:
        return '/';
    }
  }
}