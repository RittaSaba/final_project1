import 'package:equatable/equatable.dart';
import 'package:final_project1/features/tasks/data/response/task_response.dart';

import '../../../core/strings/enum_manager.dart';

class GetTaskInitial extends Equatable {
  final CubitStatuses statuses;
  final  TaskResponse result;
  final String error;

  const GetTaskInitial({
    required this.statuses,
    required this.result,
    required this.error,
  });

  factory GetTaskInitial.initial() {
    return GetTaskInitial(
      result: TaskResponse.fromJson({}),
      error: '',
      statuses: CubitStatuses.init,
    );
  }

  @override
  List<Object> get props => [statuses, result, error];

  GetTaskInitial copyWith({
    CubitStatuses? statuses,
    TaskResponse? result,
    String? error,
  }) {
    return GetTaskInitial(
      statuses: statuses ?? this.statuses,
      result: result ?? this.result,
      error: error ?? this.error,
    );
  }

}