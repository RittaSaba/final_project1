part of 'login_cubit.dart';

class LoginInitial extends Equatable {
  final CubitStatuses statuses;
  final LoginResponse result;
  final String error;

  const LoginInitial({
    required this.statuses,
    required this.result,
    required this.error,
  });

  factory LoginInitial.initial() {
    return LoginInitial(
      result: LoginResponse.fromJson({}),
      error: '',
      statuses: CubitStatuses.init,
    );
  }


  @override
  List<Object> get props => [statuses, result, error];

  LoginInitial copyWith({
    CubitStatuses? statuses,
    LoginResponse? result,
    String? error,
  }) {
    return LoginInitial(
      statuses: statuses ?? this.statuses,
      result: result ?? this.result,
      error: error ?? this.error,
    );
  }

}