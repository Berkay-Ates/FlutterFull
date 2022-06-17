import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../modal_view/image_upload_view_modal.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../../../product/utility/image_upload.dart';

class MobxImageUpload extends StatefulWidget {
  const MobxImageUpload({Key? key}) : super(key: key);

  @override
  State<MobxImageUpload> createState() => _MobxImageUploadState();
}

class _MobxImageUploadState extends State<MobxImageUpload> {
  final _imageUploadViewModal = ImageUploadViewModal();
  final _imageUploadManager = ImageUploadManager();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mobx Image'),
        actions: [
          Observer(builder: (_) {
            return _imageUploadViewModal.isLoading ? const CircularProgressIndicator() : const SizedBox.shrink();
          }),
          Observer(builder: (_) {
            return Center(child: Text(_imageUploadViewModal.downloadText));
          })
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Expanded(
                flex: 4,
                child: Observer(
                    builder: ((context) => _imageUploadViewModal.file != null
                        ? Image.file(_imageUploadViewModal.file!)
                        : const Text('no Image Here'))),
              ),
              Expanded(
                flex: 4,
                child: Observer(
                    builder: ((context) => _imageUploadViewModal.imageUrl != null
                        ? Image.network(_imageUploadViewModal.imageUrl!)
                        : const Center(child: Text('no Image to Download')))),
              )
            ],
          ),
          Row(
            children: [
              LottieImageWidget(
                lottieAsset: 'assets/lottie/lottie_image_upload.json',
                imageStuff: () async {
                  _imageUploadViewModal.saveLocaleFile(await _imageUploadManager.fetchFromLibrary());
                },
              ),
              LottieImageWidget(
                lottieAsset: 'assets/lottie/lottie_image_download.json',
                imageStuff: () async {
                  _imageUploadViewModal.saveDataToService();
                },
              )
            ],
          ),
          const Text(
            'Soldakine tiklayinca gelariden resmi seciyoruz. Sagdakine tiklayinca da secilen resmi firebse tarafina yukleyip urlyi elde ediyoruz. url gelince de otomatik olarak yuklenen resim download edilip sag tarafta gozukuyor.',
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

class LottieImageWidget extends StatelessWidget {
  const LottieImageWidget({
    Key? key,
    required String lottieAsset,
    required Function imageStuff,
  })  : _lottieAsset = lottieAsset,
        _imageStuff = imageStuff,
        super(key: key);

  final String _lottieAsset;
  final Function _imageStuff;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 4,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Card(
              elevation: 10,
              child: IconButton(
                onPressed: () async {
                  await _imageStuff.call();
                },
                icon: Lottie.asset(_lottieAsset),
                iconSize: 150,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
