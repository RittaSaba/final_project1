

import 'package:equatable/equatable.dart';
import 'package:final_project1/core/strings/enum_manager.dart';
import 'package:final_project1/features/cases2/data/response/case_response.dart';



class GetCaseInitial extends Equatable {
  final CubitStatuses statuses;
  final CaseResponse result;
  final String error;

  const GetCaseInitial({
    required this.statuses,
    required this.result,
    required this.error,
  });

  factory GetCaseInitial.initial() {
    return GetCaseInitial(
      result: CaseResponse.fromJson({}),
      error: '',
      statuses: CubitStatuses.init,
    );
  }

  @override
  List<Object> get props => [statuses, result, error];

  GetCaseInitial copyWith({
    CubitStatuses? statuses,
    CaseResponse? result,
    String? error,
  }) {
    return GetCaseInitial(
      statuses: statuses ?? this.statuses,
      result: result ?? this.result,
      error: error ?? this.error,
    );
  }

}