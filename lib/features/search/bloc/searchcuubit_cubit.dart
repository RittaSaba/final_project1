import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:final_project1/core/extensions.dart';
import 'package:final_project1/features/search/bloc/searchcuubit_state.dart';

import 'package:flutter/cupertino.dart';

import '../../../core/api/api_service.dart';
import '../../../core/api/api_url.dart';
import '../../../core/di/injection_container.dart';
import '../../../core/error/error_manager.dart';
import '../../../core/network/network_info.dart';
import '../../../core/strings/enum_manager.dart';
import '../../../core/util/note_message.dart';
import '../../../core/util/pair_class.dart';
import '../../user_profile/data/response/profile_response.dart';
import '../data/response/searchresponse.dart';

class SearchcuubitCubit extends Cubit<SeachInitial> {
  SearchcuubitCubit() : super(SeachInitial.initial());
  final network = sl<NetworkInfo>();

  Future<void> getsearch(BuildContext context) async {
    emit(state.copyWith(statuses: CubitStatuses.loading));
    final pair = await _getsearchApi();

    if (pair.first == null) {
      if (context.mounted) {
        NoteMessage.showSnakeBar(message: pair.second ?? '', context: context);
      }
      emit(state.copyWith(statuses: CubitStatuses.error, error: pair.second));
    } else {
      emit(state.copyWith(statuses: CubitStatuses.done, result: pair.first));
    }
  }

  Future<Pair<SearchResponse?, String?>> _getsearchApi() async {
    if (await network.isConnected) {
      final response = await APIService().getApi(
        url: GetUrl.search,
      );

      if (response.statusCode == 200) {
        return Pair(
            ProfileResponse.fromJson(response.toJson) as SearchResponse?, null);
      } else {
        return Pair(null, ErrorManager.getApiError(response));
      }
    } else {
      return Pair(null, 'AppStringManager.noInternet');
    }
  }
}
