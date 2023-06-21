import 'package:final_project1/core/extensions.dart';
import 'package:final_project1/core/util/shared_preferences.dart';
import 'package:final_project1/features/cases/new/bloc/cases_cubit/GetCaseInitial.dart';
import 'package:final_project1/features/cases/new/data/response/case_response.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/api/api_service.dart';
import '../../../../../core/api/api_url.dart';
import '../../../../../core/di/injection_container.dart';
import '../../../../../core/error/error_manager.dart';
import '../../../../../core/network/network_info.dart';
import '../../../../../core/strings/enum_manager.dart';
import '../../../../../core/util/note_message.dart';
import '../../../../../core/util/pair_class.dart';
import '../../data/response/cases_response.dart';
import '../../data/response/decisions_response.dart';
import '../../data/response/session_response.dart';

class GetCaseCubit extends Cubit<GetCaseInitial> {
  GetCaseCubit() : super(GetCaseInitial.initial());
  final network = sl<NetworkInfo>();

  Future<void> getCase(BuildContext context) async {
    emit(state.copyWith(statuses: CubitStatuses.loading));
    final pair = await _getCaseApi();

    if (pair.first == null) {
      if (context.mounted) {
        NoteMessage.showSnakeBar(message: pair.second ?? '', context: context);
      }
      emit(state.copyWith(statuses: CubitStatuses.error, error: pair.second));
    } else {
      emit(state.copyWith(statuses: CubitStatuses.done, result: pair.first));
    }
  }

  Future<Pair<CasesResponse?, String?>> _getCaseApi() async {
    if (await network.isConnected) {
      final response = await APIService().getApi(
        url: GetUrl.cases,
        query: {'token': AppSharedPreference.getToken()},
      );

      if (response.statusCode.success) {
        return Pair(CasesResponse.fromJson(response.toJson), null);
      } else {
        return Pair(null, ErrorManager.getApiError(response));
      }
    } else {
      return Pair(null, 'AppStringManager.noInternet');
    }
  }
}

Future<SessionResponse> getCaseSession(int id) async {
  final response = await APIService().getApi(
    url: 'api/case/$id/sessions',
    query: {'token': AppSharedPreference.getToken()},
  );

  if (response.statusCode.success) {
    return SessionResponse.fromJson(response.toJson);
  } else {
    return SessionResponse.fromJson({});
  }
}
Future<DecisionsResponse>getCaseDecision (int id) async {
  final response = await APIService().getApi(

    url: 'api/case/$id/decisions',
    query: {'token': AppSharedPreference.getToken()},
  );

  if (response.statusCode.success) {
    return DecisionsResponse.fromJson(response.toJson);
  } else {
    return DecisionsResponse.fromJson({});
  }
}
