import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:final_project1/core/api/api_url.dart';
import 'package:final_project1/features/user_profile/data/request/chang_password_request.dart';
import 'package:flutter/material.dart';

import '../../../../core/api/api_service.dart';
import '../../../../core/di/injection_container.dart';
import '../../../../core/error/error_manager.dart';
import '../../../../core/network/network_info.dart';
import '../../../../core/strings/enum_manager.dart';
import '../../../../core/util/note_message.dart';
import '../../../../core/util/pair_class.dart';
import '../../../../core/util/shared_preferences.dart';

part 'change_pass_state.dart';

class ChangePassCubit extends Cubit<ChangePassInitial> {
  ChangePassCubit() : super(ChangePassInitial.initial());

  final  network = sl<NetworkInfo>();

    Future<void> changePass(BuildContext context,{required ChangePasswordRequest request}) async {
      emit(state.copyWith(statuses: CubitStatuses.loading));
      final pair = await _changePassApi(request: request);


      if (pair.first == null) {
        if (context.mounted) {
          NoteMessage.showSnakeBar(message: pair.second ?? '', context: context);
        }
        emit(state.copyWith(statuses: CubitStatuses.error, error: pair.second));
      } else {
        emit(state.copyWith(statuses: CubitStatuses.done, result: pair.first));
      }
    }

    Future<Pair<bool?, String?>> _changePassApi({required ChangePasswordRequest request}) async {
      if (await network.isConnected) {
        final response = await APIService().postApi(
          url: PostUrl.changePass,
         // query: {'token': AppSharedPreference.getToken()},
          body: request.toMap(),
        );

        if (response.statusCode == 200) {
          return Pair(true, null);
        } else {
          return Pair(null, ErrorManager.getApiError(response));
        }
      } else {
        return Pair(null, 'AppStringManager.noInternet');
      }
    }
}
