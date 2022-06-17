import 'dart:io';
import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import '../model/image_upload_response.dart';
import '../service/image_upload_service.dart';
import 'package:mobx/mobx.dart';
part 'image_upload_view_modal.g.dart';

class ImageUploadViewModal = _ImageUploadViewModalBase with _$ImageUploadViewModal;

abstract class _ImageUploadViewModalBase with Store {
  final ImageUploadService _imageUploadService = ImageUploadService(Dio(
    BaseOptions(
      baseUrl: 'https://firebasestorage.googleapis.com/v0/b/flash-chat-8756d.appspot.com/o/',
    ),
  ));

  @observable
  String? imageUrl;

  @observable
  File? file;

  @observable
  bool isLoading = false;

  @observable
  String downloadText = 'Yüklenmedi moruq';

  @action
  void imageDownloadUrl(ImageUploadResponse? res) {
    imageUrl = 'https://firebasestorage.googleapis.com/v0/b/flash-chat-8756d.appspot.com/o/${res?.name}';
  }

  @action
  void updateDownloadText(int send, int total) {
    downloadText = '$send/$total';
  }

  @action
  void changeLoading() {
    isLoading = !isLoading;
  }

  @action
  void saveLocaleFile(XFile? file) {
    if (file == null) return;
    this.file = File(file.path);
  }

  void saveDataToService() async {
    changeLoading();
    if (file != null) {
      final response = await _imageUploadService.uploadImageToServer(await file!.readAsBytes(), 'Latest',
          onSendProgressMine: updateDownloadText);
      imageDownloadUrl(response);
    }
    changeLoading();
    return null;
  }
}
