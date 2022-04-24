import 'package:flutter/material.dart';

class ImageLearn extends StatelessWidget {
  const ImageLearn({Key? key}) : super(key: key);
  final String _networkImage =
      'https://bookinggold.com/dbimg/db_images/119/12/289134/whatsapp-%C4%B1mage-2021-01-13-at-17.18.29-(2).jpeg';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Image.network(
            _networkImage,
            height: 200,
            errorBuilder: (context, error, stackTrace) => Icon(Icons.adjust),
          ),
          PngImage(name: ImageItems().applewithbook2WithouthPath),
          Image.asset(
            ImageItems().appleWithBook,
            height: 200,
            width: 200,
            fit: BoxFit.cover,
          ),
        ],
      ),
    );
  }
}

class ImageItems {
  final String appleWithBook = 'assets/png/ScreenShot2022-04-19at21.33.57.png';
  final String appleWithBook2 = 'assets/png/Image.png';
  final String applewithbook2WithouthPath = 'Image';
}

class PngImage extends StatelessWidget {
  const PngImage({
    Key? key,
    required this.name,
  }) : super(key: key);
  final String name;
  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/png/$name.png',
      height: 200,
      width: 200,
      fit: BoxFit.cover,
    );
  }
}
