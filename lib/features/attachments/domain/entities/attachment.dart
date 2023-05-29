import 'dart:ffi';

import 'package:equatable/equatable.dart';

class Attachment extends Equatable {
final  String file_name;
final  int cases_number;
 final String Created_by;
 final UnsignedInt cases_id;


 Attachment({required this.file_name,required this.cases_number,required this.Created_by,required this.cases_id});
  @override
  // TODO: implement props
  List<Object?> get props => [file_name,cases_number,Created_by,cases_id];
}
