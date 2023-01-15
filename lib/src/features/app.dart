
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import '../config/app_theme.dart';


import '../core/router/app_router.dart';

class App extends StatelessWidget{
  const App({super.key});
  static final GoRouter appRouter = AppRouter().router();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
      [
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ]
    );
      return MaterialApp.router(
        routeInformationProvider: appRouter.routeInformationProvider,
        routeInformationParser: appRouter.routeInformationParser,
        routerDelegate: appRouter.routerDelegate,
        theme: AppTheme.themeData,
      );
  }

}