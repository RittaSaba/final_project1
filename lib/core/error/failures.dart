import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {}

//No internet
class OfflineFailure extends Failure {
  @override
  List<Object?> get props => [];
}

//api not return the posts so the problem in the server
class ServerFailure extends Failure {
  @override
  List<Object?> get props => [];
}

//request posts from database locale,and it has not posts So the error int the database
class EmptyCacheFailure extends Failure {
  @override
  List<Object?> get props => [];
}

//additional
//failure with auth
class WrongDataFailure extends Failure {
  @override
  List<Object?> get props => [];
}
