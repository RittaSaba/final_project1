
import 'dart:ffi';

import 'package:final_project1/features/attachments/domain/entities/attachment.dart';

class AttachmentModel extends Attachment {
  AttachmentModel({required String file_name, required int cases_number, required String Created_by,required UnsignedInt cases_id})
      : super(file_name: file_name, cases_number: cases_number,Created_by: Created_by,cases_id: cases_id);

  factory AttachmentModel.fromJson(Map<String, dynamic> json) {
    return AttachmentModel(file_name: json['file_name'],cases_number: json['cases_number'], Created_by: json['Created_by'], cases_id: json['cases_id']);
  }
  Map<String, dynamic> toJson() {
    return {'file_name':file_name ,  'cases_number': cases_number, 'Created_by': Created_by,  'cases_id': cases_id};
  }
}
