import 'dart:io';
import 'package:dio/dio.dart';
import '../model/resource_model.dart';

abstract class IReqresService {
  final Dio dio;
  IReqresService(this.dio);
  Future<ResourceModel?> fetchResourceItem();
}

enum ReqresPath { resource, users, unknown }

class ReqresService extends IReqresService {
  ReqresService(Dio dio) : super(dio);

  @override
  Future<ResourceModel?> fetchResourceItem() async {
    final response = await dio.get('/${ReqresPath.unknown.name}');

    if (response.statusCode == HttpStatus.ok) {
      final jsonBody = response.data;
      if (jsonBody is Map<String, dynamic>) {
        return ResourceModel.fromJson(jsonBody);
      }
    }
    throw RegresServiceError();
  }
}

class RegresServiceError implements Exception {
  @override
  String toString() {
    return 'An Error accured while Fetching data';
  }
}
