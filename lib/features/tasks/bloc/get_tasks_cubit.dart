import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:final_project1/core/extensions.dart';
import 'package:final_project1/features/tasks/data/response/task_response.dart';
import 'package:flutter/cupertino.dart';

import '../../../core/api/api_service.dart';
import '../../../core/api/api_url.dart';
import '../../../core/di/injection_container.dart';
import '../../../core/error/error_manager.dart';
import '../../../core/network/network_info.dart';
import '../../../core/strings/enum_manager.dart';
import '../../../core/util/note_message.dart';
import '../../../core/util/pair_class.dart';
import '../../../core/util/shared_preferences.dart';
import 'get_tasks_state.dart';



class GetTasksCubit extends Cubit<GetTaskInitial> {
  GetTasksCubit() : super(GetTaskInitial.initial());
  final  network = sl<NetworkInfo>();

    Future<void> getTask(BuildContext context) async {
      emit(state.copyWith(statuses: CubitStatuses.loading));
      final pair = await _getTaskApi();


      if (pair.first == null) {
        if (context.mounted) {
          NoteMessage.showSnakeBar(message: pair.second ?? '', context: context);
        }
        emit(state.copyWith(statuses: CubitStatuses.error, error: pair.second));
      } else {
        emit(state.copyWith(statuses: CubitStatuses.done, result: pair.first));
      }
    }

    Future<Pair<TaskResponse?, String?>> _getTaskApi() async {
      if (await network.isConnected) {
        final response = await APIService().getApi(
          url: GetUrl.tasks,
          query: {'token': AppSharedPreference.getToken()},
        );

        if (response.statusCode .success) {
          return Pair(TaskResponse.fromJson(response.toJson), null);
        } else {
          return Pair(null, ErrorManager.getApiError(response));
        }
      } else {
        return Pair(null, "AppStringManager.noInternet");
      }
    }

}
