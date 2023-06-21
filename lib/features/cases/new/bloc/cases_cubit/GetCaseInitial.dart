

import 'package:equatable/equatable.dart';
import 'package:final_project1/core/strings/enum_manager.dart';
import 'package:final_project1/features/cases/new/data/response/case_response.dart';

import '../../data/response/cases_response.dart';



class GetCaseInitial extends Equatable {
  final CubitStatuses statuses;
  final CasesResponse result;
  final String error;

  const GetCaseInitial({
    required this.statuses,
    required this.result,
    required this.error,
  });

  factory GetCaseInitial.initial() {
    return GetCaseInitial(
      result: CasesResponse.fromJson({}),
      error: '',
      statuses: CubitStatuses.init,
    );
  }

  @override
  List<Object> get props => [statuses, result, error];

  GetCaseInitial copyWith({
    CubitStatuses? statuses,
    CasesResponse? result,
    String? error,
  }) {
    return GetCaseInitial(
      statuses: statuses ?? this.statuses,
      result: result ?? this.result,
      error: error ?? this.error,
    );
  }

}