import 'package:final_project1/features/tasks/bloc/get_tasks_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../features/cases/new/bloc/cases_cubit/GetCaseCubit.dart';
import '../../features/cases/new/bloc/cases_cubit/GetCasesCubit.dart';
import '../../features/summaries/bloc/login_cubit/login_cubit.dart';
import '../../features/user_profile/bloc/change_pass_cubit/change_pass_cubit.dart';
import '../../features/user_profile/bloc/get_profile_cubit/get_profile_cubit.dart';
import '../network/network_info.dart';

final sl = GetIt.instance;

Future<void> init() async {

  //region auth
  sl.registerFactory(() => LoginCubit());
  sl.registerFactory(() => ChangePassCubit());
  //endregion

  //region profile

  sl.registerFactory(() => GetProfileCubit());
  //endregion

  //region cases

 sl.registerFactory(() => GetCasesCubit());
 sl.registerFactory(() => GetCaseCubit());
  //endregion

  //region tasks

  sl.registerFactory(() => GetTasksCubit());

  //endregion


  //region Core

  sl.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(connectionChecker: sl()));
  sl.registerLazySingleton(() => InternetConnectionChecker());

  //endregion



//! External

  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
}
