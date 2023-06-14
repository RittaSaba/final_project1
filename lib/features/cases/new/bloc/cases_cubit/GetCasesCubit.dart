import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:final_project1/core/extensions.dart';
import 'package:flutter/material.dart';

import '../../../../../core/api/api_service.dart';
import '../../../../../core/api/api_url.dart';
import '../../../../../core/di/injection_container.dart';
import '../../../../../core/error/error_manager.dart';
import '../../../../../core/network/network_info.dart';
import '../../../../../core/strings/enum_manager.dart';
import '../../../../../core/util/note_message.dart';
import '../../../../../core/util/pair_class.dart';
import '../../data/response/cases_response.dart';

part 'cases_state.dart';

class GetCasesCubit extends Cubit<CasesInitial> {
  GetCasesCubit() : super(CasesInitial.initial());

  final network = sl<NetworkInfo>();

  Future<void> getCases(BuildContext context) async {
    emit(state.copyWith(statuses: CubitStatuses.loading));
    final pair = await _getCasesApi();

    if (pair.first == null) {
      if (context.mounted) {
        NoteMessage.showErrorSnackBar(message: pair.second ?? '', context: context);
      }
      emit(state.copyWith(statuses: CubitStatuses.error, error: pair.second));
    } else {
      emit(state.copyWith(statuses: CubitStatuses.done, result: pair.first));
    }
  }

  Future<Pair<CasesResponse?, String?>> _getCasesApi() async {
    if (await network.isConnected) {

      final response = await APIService().getApi(url: GetUrl.profile);

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
