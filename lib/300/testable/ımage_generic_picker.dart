import 'package:flutter/material.dart';
import '../../product/utility/image_upload_manager_2.dart';

import '../../product/utility/image_upload.dart';

class ImageGenericPicker extends StatefulWidget {
  const ImageGenericPicker({Key? key}) : super(key: key);

  @override
  State<ImageGenericPicker> createState() => _ImageGenericPickerState();
}

class _ImageGenericPickerState extends State<ImageGenericPicker> {
  final _imageUploadManager = ImageUploadManager();
  late final _imageUploadManagerGenericGallery;
  late final _imageUploadManagerGenericCamera;

  @override
  void initState() {
    super.initState();
    _imageUploadManagerGenericGallery = ImageUploadManagerGeneric(FetchImageFromGallery());
    _imageUploadManagerGenericCamera = ImageUploadManagerGeneric(FetchImageFromCamera());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('collect the images'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
                onPressed: () {
                  _imageUploadManager.fetchFromLibrary();
                },
                child: const Text('pick from gallery')),
            ElevatedButton(
                onPressed: () {
                  _imageUploadManagerGenericGallery.cropWithFetch();
                },
                child: const Text('pick from camera')),
            ElevatedButton(onPressed: () {}, child: const Text('pick from anywhere')),
          ],
        ),
      ),
    );
  }
}
