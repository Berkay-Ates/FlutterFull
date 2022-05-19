import 'package:dio/dio.dart';

class ProjectDioMixin {
  final dioService = Dio(BaseOptions(baseUrl: 'https://reqres.in/api'));
}
