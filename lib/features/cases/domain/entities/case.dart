/*import 'package:equatable/equatable.dart';

class Case extends Equatable {
  final int? id;
  final String title;
  final String body;
  Post({this.id, required this.title, required this.body});
  @override
  // TODO: implement props
  List<Object?> get props => [id, title, body];
}
*/
import 'dart:ffi';

import 'package:equatable/equatable.dart';

class Case1  extends Equatable{
  final int id;
  final String title;
  final String Status;
  final int Value_Status;
  final String case_room;
  final int court_id;

  Case1(
      {required this.id,
        required this.title,
        required this.Status,
        required this.Value_Status,
        required this.case_room,
        required this.court_id,
      });

  @override
  // TODO: implement props
  List<Object?> get props => [id, title, Status,Value_Status,case_room,court_id];




}