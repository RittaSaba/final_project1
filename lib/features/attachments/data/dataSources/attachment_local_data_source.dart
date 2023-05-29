import 'dart:convert';


import 'package:dartz/dartz.dart';
import 'package:final_project1/features/attachments/domain/entities/attachment.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/error/exception.dart';
import '../models/attachment_model.dart';

abstract class AttachmentLocalDataSource {
  Future<List<AttachmentModel>> getCachedAttachments();
  Future<Unit> cacheAttachments(List<AttachmentModel> AttachmentModels);
}

const CACHED_ATTACHMENTS = "CACHED_ATTACHMENTS";

class AttachmentLocalDataSourceImpl implements AttachmentLocalDataSource {
  final SharedPreferences sharedPreferences;
  AttachmentLocalDataSourceImpl({required this.sharedPreferences});


  @override
  Future<Unit> cacheAttachments(List<AttachmentModel> attachmentModels) {
    List attachmenttModelsToJson = attachmentModels
        .map<Map<String, dynamic>>((attachmentModels) => attachmentModels.toJson())
        .toList();
    sharedPreferences.setString(CACHED_ATTACHMENTS, json.encode(attachmenttModelsToJson));
    return Future.value(unit);
  }





  @override
  Future<List<AttachmentModel>> getCachedAttachments() {
    final jsonString = sharedPreferences.getString(CACHED_ATTACHMENTS);
    if (jsonString != null) {
      List decodeJsonData = json.decode(jsonString);
      List<AttachmentModel> jsonToAttachmentModels = decodeJsonData
          .map<AttachmentModel>((jsonAttachmentModel) => AttachmentModel.fromJson(jsonAttachmentModel))
          .toList();
      return Future.value(jsonToAttachmentModels);
    } else {
      throw EmptyCacheException();
    }
  }}
