part of 'change_pass_cubit.dart';

class ChangePassInitial extends Equatable {
  final CubitStatuses statuses;
  final bool result;
  final String error;

  const ChangePassInitial({
    required this.statuses,
    required this.result,
    required this.error,
  });

  factory ChangePassInitial.initial() {
    return const ChangePassInitial(
      result: false,
      error: '',
      statuses: CubitStatuses.init,
    );
  }

  @override
  List<Object> get props => [statuses, result, error];

  ChangePassInitial copyWith({
    CubitStatuses? statuses,
    bool? result,
    String? error,
  }) {
    return ChangePassInitial(
      statuses: statuses ?? this.statuses,
      result: result ?? this.result,
      error: error ?? this.error,
    );
  }
}
