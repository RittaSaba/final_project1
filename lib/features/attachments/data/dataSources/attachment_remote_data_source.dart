import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:final_project1/features/attachments/domain/entities/attachment.dart';
import 'package:http/http.dart' as http;

import '../../../../core/error/exception.dart';
import '../models/attachment_model.dart';

abstract class AttachmentRemoteDataSource {
  Future<List<AttachmentModel>> getAllAttachments();
  Future<Unit> deleteAttachment(int attachmentId);
  Future<Unit> updateAttachment(AttachmentModel attachmentModel);
  Future<Unit> addAttachment(AttachmentModel attachmentModel);
}

const BASE_URL = "https://jsonplaceholder.typicode.com";

class AttachmentRemoteDataSourceImpl implements AttachmentRemoteDataSource {
  final http.Client client;

  AttachmentRemoteDataSourceImpl({required this.client});
  @override
  Future<Unit> addAttachment(AttachmentModel attachmentModel) async {
    //first i create a map contain the title and body of the post
    final body = {
      "file_name":attachmentModel.file_name,
      "cases_number":attachmentModel.cases_number,
      "Created_by":attachmentModel.Created_by,
      "cases_id":attachmentModel.cases_id,
    };
    final response =

    await client.post(Uri.parse(BASE_URL + "/posts/"), body: body);
    //now i will check of the status call of the response, create =>201, else e have a problem

    if (response.statusCode == 201) {
      return Future.value(unit);
    } else {
      throw ServerException();
    }
  }

  @override
  Future<Unit> deleteAttachment(int attachmentId) async {
    final response = await client.delete(
      Uri.parse(BASE_URL + "/posts/${attachmentId.toString()}"),
      headers: {"Content-Type": "application//json"},
    );
    if (response.statusCode == 200) {
      return Future.value(unit);
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<AttachmentModel>> getAllAttachments() async {
    final response = await client.get(
      Uri.parse(BASE_URL + "/posts"),
      headers: {"Content-Type": "application//json"},
    );
    if (response.statusCode == 200) {
      final List decodedJson = json.decode(response.body) as List;
      final List<AttachmentModel> attachmentModels = decodedJson
          .map<AttachmentModel>((jsonAttachmentModel) => AttachmentModel.fromJson(jsonAttachmentModel))
          .toList();
      return attachmentModels;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<Unit> updateAttachment(AttachmentModel attachmentModel) async {

    //final attachmentId = attachmentModel.attachmentId.toString();
    final body = {
      "file_name":attachmentModel.file_name,
      "cases_number":attachmentModel.cases_number,
      "Created_by":attachmentModel.Created_by,
      "cases_id":attachmentModel.cases_id,
    };

    final response =
    await client.patch(Uri.parse (BASE_URL + "/posts/$attachmentModel"), body: body);
    if (response.statusCode == 200) {
      return Future.value(unit);
    } else {
      throw ServerException();
    }
  }
}
