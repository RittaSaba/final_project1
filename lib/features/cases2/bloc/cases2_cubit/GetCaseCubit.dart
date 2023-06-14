import 'package:final_project1/core/extensions.dart';
import 'package:final_project1/features/cases2/bloc/cases2_cubit/GetCaseInitial.dart';
import 'package:final_project1/features/cases2/data/response/case_response.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/api/api_service.dart';
import '../../../../core/api/api_url.dart';
import '../../../../core/di/injection_container.dart';
import '../../../../core/error/error_manager.dart';
import '../../../../core/network/network_info.dart';
import '../../../../core/strings/enum_manager.dart';
import '../../../../core/util/note_message.dart';
import '../../../../core/util/pair_class.dart';

class GetCaseCubit extends Cubit<GetCaseInitial> {
  GetCaseCubit() : super(GetCaseInitial.initial());
  final  network = sl<NetworkInfo>();

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

    Future<Pair<CaseResponse?, String?>> _getCaseApi() async {
      if (await network.isConnected) {
        final response = await APIService().postApi(
          url:  GetUrl.profile, query: {'token': acccessToken},
        );

        if (response.statusCode.success) {
          return Pair(CaseResponse.fromJson(response.toJson), null);
        } else {
          return Pair(null, ErrorManager.getApiError(response));

        }
      } else {
        return Pair(null, 'AppStringManager.noInternet');

      }
    }
}
