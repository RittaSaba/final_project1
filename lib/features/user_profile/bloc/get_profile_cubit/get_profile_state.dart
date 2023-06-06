part of 'get_profile_cubit.dart';

class GetProfileInitial extends Equatable {
  final CubitStatuses statuses;
  final ProfileResponse result;
  final String error;

  const GetProfileInitial({
    required this.statuses,
    required this.result,
    required this.error,
  });

  factory GetProfileInitial.initial() {
    return GetProfileInitial(
      result: ProfileResponse.fromJson({}),
      error: '',
      statuses: CubitStatuses.init,
    );
  }

  @override
  List<Object> get props => [statuses, result, error];

  GetProfileInitial copyWith({
    CubitStatuses? statuses,
    ProfileResponse? result,
    String? error,
  }) {
    return GetProfileInitial(
      statuses: statuses ?? this.statuses,
      result: result ?? this.result,
      error: error ?? this.error,
    );
  }

}