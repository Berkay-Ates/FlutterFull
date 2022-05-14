import 'package:flutter/material.dart';

class AlertImageZoom extends StatelessWidget {
  const AlertImageZoom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Image Zoom Alert')),
      floatingActionButton: FloatingActionButton(onPressed: () async {
        final response = await showDialog(context: context, builder: (context) => const _ImageZoom());
      }),
      body: null,
    );
  }
}

class _ImageZoom extends StatelessWidget {
  const _ImageZoom({Key? key}) : super(key: key);
  final String _imageurl = 'https://picsum.photos/200';

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: InteractiveViewer(
        child: Image.network(
          _imageurl,
          width: MediaQuery.of(context).size.width * 90.0,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
