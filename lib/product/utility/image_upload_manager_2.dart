import 'package:image_picker/image_picker.dart';

//* Testable generic usage starts --- --- --- --- ---

class ImageUploadManagerGeneric {
  final IImageUpload iImageUpload;
  ImageUploadManagerGeneric(this.iImageUpload);

  Future<XFile?> cropWithFetch() async {
    return await iImageUpload.fetch();
  }
}

abstract class IImageUpload {
  final ImagePicker picker = ImagePicker();
  Future<XFile?> fetch();
}

class FetchImageFromGallery extends IImageUpload {
  @override
  Future<XFile?> fetch() async {
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    return image;
  }
}

class FetchImageFromCamera extends IImageUpload {
  @override
  Future<XFile?> fetch() async {
    final XFile? image = await picker.pickImage(source: ImageSource.camera);
    return image;
  }
}
