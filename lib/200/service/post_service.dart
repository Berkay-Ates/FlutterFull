import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import 'comment_model.dart';
import 'post_model.dart';

abstract class IPostService {
  Future<bool> _addItemToService(PostModel model);
  Future<bool> _puttItemToService(PostModel model, int id);
  Future<bool> _deleteItemFromService(int id);
  Future<List<PostModel>?> fetchPostItemsAdvance();
  Future<List<CommentModel>?> fetchRelatedCommentsWithPostId(int id);
}

class PostService implements IPostService {
  final Dio _dio;
  PostService() : _dio = Dio(BaseOptions(baseUrl: 'https://jsonplaceholder.typicode.com/'));

  @override
  Future<bool> _addItemToService(PostModel model) async {
    try {
      final response = await _dio.post(_PostServicePaths.posts.name, data: model);
      return response.statusCode == HttpStatus.created;
    } on DioError catch (exception) {
      _ShowDebug.showDioError(exception, this);
    }
    return false;
  }

  @override
  Future<bool> _puttItemToService(PostModel model, int id) async {
    try {
      final response = await _dio.put('${_PostServicePaths.posts.name}$id', data: model);
      return response.statusCode == HttpStatus.ok;
    } on DioError catch (exception) {
      _ShowDebug.showDioError(exception, this);
    }
    return false;
  }

  @override
  Future<bool> _deleteItemFromService(int id) async {
    try {
      final response = await _dio.delete('${_PostServicePaths.posts.name}$id');
      return response.statusCode == HttpStatus.created;
    } on DioError catch (exception) {
      _ShowDebug.showDioError(exception, this);
    }
    return false;
  }

  @override
  Future<List<PostModel>?> fetchPostItemsAdvance() async {
    try {
      final response = await _dio.get(_PostServicePaths.posts.name);
      if (response.statusCode == HttpStatus.ok) {
        final _datas = response.data;
        if (_datas is List) {
          return _datas.map((e) => PostModel.fromJson(e)).toList();
        }
      }
    } on DioError catch (exception) {
      _ShowDebug.showDioError(exception, this);
      return null;
    }
  }

  @override
  Future<List<CommentModel>?> fetchRelatedCommentsWithPostId(int id) async {
    try {
      final response = await _dio.get(
        _PostServicePaths.comments.name,
        queryParameters: {_PostQueryPaths.postId.name: id},
      );
      if (response.statusCode == HttpStatus.ok) {
        final _datas = response.data;
        if (_datas is List) {
          return _datas.map((e) => CommentModel.fromJson(e)).toList();
        }
      }
    } on DioError catch (exception) {
      _ShowDebug.showDioError(exception, this);
      return null;
    }
  }
}

//* herhangi bir yerde manuel olarak statik değerler tanımlıyorsak orada yanlış olan birşeyler
//* oldugunu söyleyebiliriz. Bu gibi durumlardan ilk çıkar noktamız enumları kullanmaktır.

enum _PostServicePaths { posts, comments } //! enumlara ile static kodların önüne geçebiliriz.
enum _PostQueryPaths { postId } //! enumlara ile static kodların önüne geçebiliriz.

class _ShowDebug {
  static void showDioError<T>(DioError error, T type) {
    if (kDebugMode) {
      print(error.message);
      print(type);
    }
  }
}
