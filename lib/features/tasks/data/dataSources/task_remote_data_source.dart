import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:final_project1/features/attachments/domain/entities/attachment.dart';
import 'package:http/http.dart' as http;

import '../../../../core/error/exception.dart';
import '../models/task_model.dart';
abstract class TaskRemoteDataSource {
  Future<List<TaskModel>> getAllTasks();
  Future<Unit> deleteTask(int taskId);
  Future<Unit> updateTask(TaskModel taskModel);
  Future<Unit> addTask(TaskModel taskModel);
}

const BASE_URL = "https://jsonplaceholder.typicode.com";

class TaskRemoteDataSourceImpl implements TaskRemoteDataSource {
  final http.Client client;

  TaskRemoteDataSourceImpl({required this.client});
  @override
  Future<Unit> addTask(TaskModel taskModel) async {
    //first i create a map contain the title and body of the post
    final body = {
      "id":taskModel.id,
      "type_id":taskModel.type_id,
      "task_name":taskModel.task_name,
      "description":taskModel.description,
      "start_date":taskModel.start_date,
      "end_date":taskModel.end_date,
      "status":taskModel.status,
      "status_value":taskModel.status_value,
      "user_first_name":taskModel.user_first_name,
      "user_last_name":taskModel.user_last_name,
      "case_number":taskModel.case_number,
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
  Future<Unit> deleteTask(int taskId) async {
    final response = await client.delete(
      Uri.parse(BASE_URL + "/posts/${taskId.toString()}"),
      headers: {"Content-Type": "application//json"},
    );
    if (response.statusCode == 200) {
      return Future.value(unit);
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<TaskModel>> getAllTasks() async {
    final response = await client.get(
      Uri.parse(BASE_URL + "/posts"),
      headers: {"Content-Type": "application//json"},
    );
    if (response.statusCode == 200) {
      final List decodedJson = json.decode(response.body) as List;
      final List<TaskModel> taskModels = decodedJson
          .map<TaskModel>((jsonTaskModel) => TaskModel.fromJson(jsonTaskModel))
          .toList();
      return taskModels;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<Unit> updateTask(TaskModel taskModel) async {

    //final attachmentId = attachmentModel.attachmentId.toString();
    final body = {
      "id":taskModel.id,
      "type_id":taskModel.type_id,
      "task_name":taskModel.task_name,
      "description":taskModel.description,
      "start_date":taskModel.start_date,
      "end_date":taskModel.end_date,
      "status":taskModel.status,
      "status_value":taskModel.status_value,
      "user_first_name":taskModel.user_first_name,
      "user_last_name":taskModel.user_last_name,
      "case_number":taskModel.case_number,
    };

    final response =
    await client.patch(Uri.parse (BASE_URL + "/posts/$taskModel"), body: body);
    if (response.statusCode == 200) {
      return Future.value(unit);
    } else {
      throw ServerException();
    }
  }


}
