import 'package:flutter/material.dart';

import '../features/auth/presentation/pages/login_screen.dart';
import '../features/splash_screen/plash_screen.dart';

class AppRoutes {
  static Route<dynamic> routes(RouteSettings settings) {
    var screenName = settings.name;

    switch (screenName) {
      //region auth

      case RouteName.splash:
        //region
        return MaterialPageRoute(builder: (_) => const SplashScreenPage());
      //endregion

      case RouteName.signup:
      //region
      // {
      //   return MaterialPageRoute(builder: (context) {
      //     return const SignupPage();
      //   });
      // }
      //endregion

      case RouteName.login:
        //region
        return MaterialPageRoute(builder: (context) {
          return const LoginPage();
        });
      //endregion

      //endregion
    }

    return MaterialPageRoute(builder: (_) => const Scaffold());
  }
}

class RouteName {
  static const splash = '/';
  static const signup = '/1';
  static const login = '/2';
  static const forgetPassword = '/3';
  static const home = '/4';
}
