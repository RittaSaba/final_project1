
import 'package:equatable/equatable.dart';

class Casese_details extends Equatable {

final  int id;
 final String title;
final String facts;
final String legal_discussion;
final int id_cases;


Casese_details({required this.id,required this.title,required this.facts,required this.legal_discussion,required this.id_cases});
  @override
  // TODO: implement props
  List<Object?> get props => [id,title,facts,legal_discussion,id_cases];
}
