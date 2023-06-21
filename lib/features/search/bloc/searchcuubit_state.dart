import 'package:equatable/equatable.dart';

import '../../../core/strings/enum_manager.dart';
import '../data/response/searchresponse.dart';

class SeachInitial extends Equatable {
  final CubitStatuses statuses;
  final SearchResponse result;
  final String error;

  const SeachInitial({
    required this.statuses,
    required this.result,
    required this.error,
  });

  factory SeachInitial.initial() {
    return SeachInitial(
      result:SearchResponse.fromJson({}),
      error: '',
      statuses: CubitStatuses.init,
    );
  }

  @override
  List<Object> get props => [statuses, result, error];

  SeachInitial copyWith({
    CubitStatuses? statuses,
    SearchResponse? result,
    String? error,
  }) {
    return SeachInitial(
      statuses: statuses ?? this.statuses,
      result: result ?? this.result,
      error: error ?? this.error,
    );
  }

}