part of 'cases_cubit.dart';

class CasesInitial extends Equatable {
  final CubitStatuses statuses;
  final CasesResponse result;
  final String error;

  const CasesInitial({
    required this.statuses,
    required this.result,
    required this.error,
  });

  factory CasesInitial.initial() {
    return CasesInitial(
      result: CasesResponse.fromJson({}),
      error: '',
      statuses: CubitStatuses.init,
    );
  }

  @override
  List<Object> get props => [statuses, result, error];

  CasesInitial copyWith({
    CubitStatuses? statuses,
    CasesResponse? result,
    String? error,
  }) {
    return CasesInitial(
      statuses: statuses ?? this.statuses,
      result: result ?? this.result,
      error: error ?? this.error,
    );
  }

}