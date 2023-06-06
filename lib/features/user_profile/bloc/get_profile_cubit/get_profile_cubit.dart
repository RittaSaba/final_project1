import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:final_project1/core/extensions.dart';
import 'package:final_project1/features/user_profile/data/response/profile_response.dart';
import 'package:flutter/material.dart';

import '../../../../core/api/api_service.dart';
import '../../../../core/api/api_url.dart';
import '../../../../core/di/injection_container.dart';
import '../../../../core/error/error_manager.dart';
import '../../../../core/network/network_info.dart';
import '../../../../core/strings/enum_manager.dart';
import '../../../../core/util/note_message.dart';
import '../../../../core/util/pair_class.dart';

part 'get_profile_state.dart';

class GetProfileCubit extends Cubit<GetProfileInitial> {
  GetProfileCubit() : super(GetProfileInitial.initial());

  final network = sl<NetworkInfo>();

  Future<void> getProfile(BuildContext context) async {
    emit(state.copyWith(statuses: CubitStatuses.loading));
    final pair = await _getProfileApi();

    if (pair.first == null) {
      if (context.mounted) {
        NoteMessage.showErrorSnackBar(
            message: pair.second ?? '', context: context);
      }
      emit(state.copyWith(statuses: CubitStatuses.error, error: pair.second));
    } else {
      emit(state.copyWith(statuses: CubitStatuses.done, result: pair.first));
    }
  }

  Future<Pair<ProfileResponse?, String?>> _getProfileApi() async {
    if (await network.isConnected) {
      final response = await APIService()
          .getApi(url: GetUrl.profile, query: {'token': acccessToken});

      if (response.statusCode.success) {
        return Pair(ProfileResponse.fromJson(response.toJson), null);
      } else {
        return Pair(null, ErrorManager.getApiError(response));
      }
    } else {
      return Pair(null, 'AppStringManager.noInternet');
    }
  }
}
