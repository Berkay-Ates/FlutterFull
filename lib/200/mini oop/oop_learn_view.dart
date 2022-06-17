import 'package:flutter/material.dart';
import '../mini%20oop/oop_learn.dart';

class OOPLearnView extends StatefulWidget {
  const OOPLearnView({Key? key}) : super(key: key);

  @override
  State<OOPLearnView> createState() => _OOPLearnViewState();
}

class _OOPLearnViewState extends State<OOPLearnView> {
  FileDownload? fileDownload;

  @override
  void initState() {
    super.initState();
    fileDownload = FileDownload();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: const [
          Center(
            child: CircularProgressIndicator(
              color: Colors.white,
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          fileDownload?.downloadItem(null);
        },
        child: const Icon(Icons.download),
      ),
      body: null,
    );
  }
}
