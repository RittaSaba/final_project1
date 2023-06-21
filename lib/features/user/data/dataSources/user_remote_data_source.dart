import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

import '../../../../core/error/exception.dart';
import '../models/user_model.dart';

abstract class UserRemoteDataSource {
  Future<List<UserModel>> getAllUsers();
  Future<Unit> updateUser(UserModel userModel);
}

const BASE_URL = "https://jsonplaceholder.typicode.com";

class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  final http.Client client;

  UserRemoteDataSourceImpl({required this.client});

  @override
  Future<List<UserModel>> getAllUsers() async {
    final response = await client.get(
      Uri.parse(BASE_URL + "/posts"),
      headers: {"Content-Type": "application//json"},
    );
    if (response.statusCode == 200) {
      final List decodedJson = json.decode(response.body) as List;
      final List<UserModel> userModels = decodedJson
          .map<UserModel>((jsonUserModel) => UserModel.fromJson(jsonUserModel))
          .toList();
      return userModels;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<Unit> updateUser(UserModel userModel) async {

    //final attachmentId = attachmentModel.attachmentId.toString();
    final body = {



   "id":userModel.id,
    "first_name":userModel.first_name,
    "last_name":userModel.last_name,
    "mother_name":userModel.mother_name,
    "father_name":userModel.father_name,
    "birth_date":userModel.birth_date,
    "birth_place":userModel.birth_place,
    "email":userModel.email,
    "roles_name":userModel.roles_name,
    "Status":userModel.Status,
    "password":userModel.password,
    "location":userModel.location,
    "phone":userModel.phone,


    };

    final response =
    await client.patch(Uri.parse (BASE_URL + "/posts/$userModel"), body: body);
    if (response.statusCode == 200) {
      return Future.value(unit);
    } else {
      throw ServerException();
    }
  }
}
