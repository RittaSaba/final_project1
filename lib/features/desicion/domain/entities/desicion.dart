
import 'dart:ffi';

import 'package:equatable/equatable.dart';

class Desicion extends Equatable {

final  int id;

final UnsignedInt case_id;
final String description;
final int number;
final DateTime date;


Desicion({required this.id,required this.case_id,required this.description,required this.number,required this.date});
  @override
  // TODO: implement props
  List<Object?> get props => [id,case_id,description,number,date];
}
