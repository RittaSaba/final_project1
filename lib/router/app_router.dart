
import 'package:final_project1/core/basic_screen.dart';
import 'package:final_project1/features/cases/new/bloc/cases_cubit/GetCasesCubit.dart';
import 'package:final_project1/features/cases/new/data/response/cases_response.dart';
import 'package:final_project1/features/cases/new/ui/pages/case_display.dart';
import 'package:final_project1/features/tasks/bloc/get_tasks_cubit.dart';
import 'package:final_project1/features/tasks/ui/pages/tasks_display.dart';
import 'package:final_project1/features/user_profile/ui/pages/change_password_in_user_profil_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../core/di/injection_container.dart';
import '../features/auth/presentation/pages/login_screen.dart';
import '../features/cases/new/bloc/cases_cubit/GetCaseCubit.dart';
import '../features/splash_screen/plash_screen.dart';
import '../features/summaries/bloc/login_cubit/login_cubit.dart';
import '../features/tasks/ui/pages/add_task_page.dart';
import '../features/tasks/ui/widgets/task_page.dart';
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
          BlocProvider(create: (context) => sl<ChangePassCubit>()),
        ];

        return MaterialPageRoute(builder: (context) {
          return MultiBlocProvider(
            providers: providers,
            child: const ChangePasswordPage(),
          );
        });

      //endregion

      case RouteName.login:
        //region
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

      case RouteName.caseDetails:
        //region
        final providers = [
          BlocProvider(
              create: (context) => sl<GetCasesCubit>()),
        ];

        return MaterialPageRoute(builder: (context) {
          return MultiBlocProvider(
            providers: providers,
            child: Case_Display(modelCase: settings.arguments as Case),
          );
        });

      //endregion


     /* case RouteName.taskslawyer:
        final providers = [
          BlocProvider(
              create: (context) => sl<GetTasksCubit>()..getTask(context)),
        ];
        //region
        return MaterialPageRoute(builder: (context) {
          return MultiBlocProvider(
            providers: providers,
            child: const TasksDisplay(),
          );
        });

*/



      case RouteName.addTask:
        //region
        return MaterialPageRoute(builder: (context) {
          return const AddTaskePage();
        });



      //endregion
      case RouteName.tasks:
        //region
        return MaterialPageRoute(builder: (context) {
          return const TaskPage();
        });
      //endregion

      case RouteName.basicScreen:
        final providers = [
          BlocProvider(
              create: (context) => sl<GetCaseCubit>()..getCase(context)),
          BlocProvider(
              create: (context) => sl<GetTasksCubit>()..getTask(context)),
        ];
        //region
        return MaterialPageRoute(builder: (context) {
          return MultiBlocProvider(
            providers: providers,
            child: BasicScreen(),
          );
        });
      //endregion

      //region cases
      case RouteName.userProfileDetails:
        final providers = [
          BlocProvider(
              create: (context) => sl<GetProfileCubit>()..getProfile(context)),
        ];

        return MaterialPageRoute(builder: (context) {
          return MultiBlocProvider(
            providers: providers,
            child: UserProfileDetails(),
          );
        });

      //endregion

      //region

      // case RouteName.caseDetails:
      //   final providers = [
      //     BlocProvider(
      //         create: (context) => sl<GetCasesCubit>()..getCases(context)),
      //   ];
      //   return MaterialPageRoute(builder: (context) {
      //     return MultiBlocProvider(
      //       providers: providers,
      //       child: const LoginPage(),
      //     );
      //   });
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
  static const addTask = '/8';
  static const tasks = '/9';
 // static const taskslawyer = '/10';

}
