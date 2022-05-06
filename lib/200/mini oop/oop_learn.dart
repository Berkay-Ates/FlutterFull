import 'dart:io';

import 'package:master/200/mini%20oop/custom_exception.dart';
import 'package:url_launcher/url_launcher.dart';

abstract class IFileDownload {
  bool? downloadItem(FileItem? fileItem);

  void toShare(String _path) async {
    await launchUrl(Uri.parse(_path));
  }
}

class FileDownload extends IFileDownload {
  @override
  bool? downloadItem(FileItem? fileItem) {
    if (fileItem == null) throw FileDownloadException();
    print('file object downloading');

    return true;
  }
}

class SMSDownload implements IFileDownload {
  @override
  bool? downloadItem(FileItem? fileItem) {
    // TODO: implement downloadItem
    throw UnimplementedError();
  }

  @override
  void toShare(String _path) async {
    await launchUrl(Uri.parse('SMS≈$_path'));
  }
}

class Veli extends IFileDownload with ShareMixin {
  @override
  bool? downloadItem(FileItem? fileItem) {
    // TODO: implement downloadItem
    throw UnimplementedError();
  }

  @override
  void toShowFile() {
    // TODO: implement toShowFile
  }

  @override
  void toShowFile2() {
    // TODO: implement toShowFile2
  }
}

mixin ShareMixin on IFileDownload {
  void toShowFile();
  void toShowFile2();
  void toShowFileWithBody() {
    print('hello world');
  }
}

class FileItem {
  final String? name;
  final File? file;
  FileItem(this.name, this.file);
}
