import 'package:flutter/material.dart';
import '../product/global/resource_context.dart';
import 'package:provider/provider.dart';

class ImageLearn200 extends StatefulWidget {
  const ImageLearn200({Key? key}) : super(key: key);

  @override
  State<ImageLearn200> createState() => _ImageLearn200State();
}

class _ImageLearn200State extends State<ImageLearn200> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.read<ResourceContext>().model?.data?.length.toString() ?? '***'),
        actions: [
          IconButton(onPressed: () => context.read<ResourceContext>().clearCache(), icon: const Icon(Icons.abc))
        ],
      ),
      body: Column(
        children: [
          Image.asset(ImagePath.ic_roundedimage.path()),
          ImagePath.ic_roundedimage.toWidget(heigt: 230),
        ],
      ),
    );
  }
}

enum ImagePath {
// ignore: constant_identifier_names
  ic_roundedimage,
}

extension ImagePathsExstension on ImagePath {
  String path() {
    return 'assets/png/$name.png';
  }

  Widget toWidget({double heigt = 24}) {
    return Image.asset(
      path(),
      height: heigt,
    );
  }
}
