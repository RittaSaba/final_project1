import 'package:final_project1/core/basic_screen.dart';
import 'package:final_project1/features/cases/new/bloc/cases_cubit/cases_cubit.dart';
import 'package:final_project1/features/cases/presentation/pages/case_display.dart';
import 'package:final_project1/features/user_profile/ui/pages/change_password_in_user_profil_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../core/di/injection_container.dart';
import '../features/auth/presentation/pages/login_screen.dart';
import '../features/splash_screen/plash_screen.dart';
import '../features/summaries/bloc/login_cubit/login_cubit.dart';
import '../features/user_profile/bloc/change_pass_cubit/change_pass_cubit.dart';
import '../features/user_profile/bloc/get_profile_cubit/get_profile_cubit.dart';
import '../features/user_profile/ui/pages/user_profile_details.dart';

class AppRoutes {
  static Route<dynamic> routes(RouteSettings settings) {
    var screenName = settings.name;

    switch (screenName) {
      //region auth

      case RouteName.splash:
        //region
        return MaterialPageRoute(builder: (_) => const SplashScreenPage());
      //endregion

      case RouteName.changePassword:
        //region
        final providers = [
          BlocProvider(
              create: (context) => sl<ChangePassCubit>()),
        ];

        return MaterialPageRoute(builder: (context) {
          return MultiBlocProvider(
            providers: providers,
            child: const ChangePasswordPage(),
          );
        });

      //endregion

      //region
      case RouteName.login:
        final providers = [
          BlocProvider(create: (context) => sl<LoginCubit>()),
        ];

        return MaterialPageRoute(builder: (context) {
          return MultiBlocProvider(
            providers: providers,
            child: const LoginPage(),
          );
        });

      //endregion

      //region
      case RouteName.caseDetails:
        final providers = [
          BlocProvider(
              create: (context) => sl<GetCasesCubit>()..getCases(context)),
        ];

        return MaterialPageRoute(builder: (context) {
          return MultiBlocProvider(
            providers: providers,
            child: Case_Display(),
          );
        });

      //endregion

      //region
      case RouteName.basicScreen:
        return MaterialPageRoute(builder: (context) {
          return BasicScreen();
        });
      //endregion

      //region
      case RouteName.userProfileDetails:
        final providers = [
          BlocProvider(
              create: (context) => sl<GetProfileCubit>()..getProfile(context)),
        ];
        return MaterialPageRoute(builder: (context) {
          return MultiBlocProvider(
            providers: providers,
            child: const UserProfileDetails(),
          );
        });
    }

    return MaterialPageRoute(builder: (_) => const Scaffold());
  }
}

class RouteName {
  static const splash = '/';
  static const signup = '/1';
  static const login = '/2';
  static const forgetPassword = '/3';
  static const basicScreen = '/4';
  static const changePassword = '/5';
  static const userProfileDetails = '/6';
  static const caseDetails = '/7';
}
