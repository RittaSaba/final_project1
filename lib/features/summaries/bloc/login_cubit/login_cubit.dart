import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:final_project1/core/api/api_url.dart';
import 'package:final_project1/core/extensions.dart';
import 'package:final_project1/core/util/shared_preferences.dart';
import 'package:final_project1/features/summaries/data/request/login__request.dart';
import 'package:final_project1/features/summaries/data/response/login_response.dart';
import 'package:flutter/material.dart';

import '../../../../core/api/api_service.dart';
import '../../../../core/di/injection_container.dart';
import '../../../../core/error/error_manager.dart';
import '../../../../core/network/network_info.dart';
import '../../../../core/strings/enum_manager.dart';
import '../../../../core/util/note_message.dart';
import '../../../../core/util/pair_class.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginInitial> {
  LoginCubit() : super(LoginInitial.initial());

  final network = sl<NetworkInfo>();

  Future<void> login(BuildContext context,
      {required LoginRequest request}) async {

    emit(state.copyWith(statuses: CubitStatuses.loading));

    final pair = await _loginApi(request: request);

    if (pair.first == null) {
      if (context.mounted) {
        NoteMessage.showSnakeBar(message: pair.second ?? '', context: context);
      }

      emit(state.copyWith(statuses: CubitStatuses.error, error: pair.second));
    } else {

      AppSharedPreference.cashUser(pair.first!.user);

      AppSharedPreference.cashToken(pair.first!.accessToken);

      emit(state.copyWith(statuses: CubitStatuses.done, result: pair.first));
    }
  }

  Future<Pair<LoginResponse?, String?>> _loginApi(
      {required LoginRequest request}) async {
    if (await network.isConnected) {
      final response = await APIService().postApi(
        url: PostUrl.login,
        query: request.toJson(),
      );

      if (response.statusCode.success) {
        return Pair(LoginResponse.fromJson(response.toJson), null);
      } else {
        return Pair(null, ErrorManager.getApiError(response));
      }
    } else {
      return Pair(null, 'no connection ');
    }
  }
}
