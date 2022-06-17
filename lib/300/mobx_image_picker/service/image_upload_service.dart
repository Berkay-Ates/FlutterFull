import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';
import 'package:dio/dio.dart';
import '../model/image_upload_response.dart';
import '../../reqres_resource/model/resource_model.dart';

class ImageUploadService {
  final Dio dio;

  ImageUploadService(this.dio);

  Future<ImageUploadResponse?> uploadImageToServer(Uint8List byteArray, String name,
      {void Function(int, int)? onSendProgressMine}) async {
    var formData = FormData.fromMap({'': MultipartFile.fromBytes(byteArray)});

    final response = await dio.post('$name.png', data: formData, onSendProgress: onSendProgressMine);
    inspect(response.statusCode);
    if (response.statusCode == HttpStatus.ok) {
      inspect(response);
      return ImageUploadResponse.fromJson(response.data);
    }
    return null;
  }
}
