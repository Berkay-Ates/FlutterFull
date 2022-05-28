// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image_upload_view_modal.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ImageUploadViewModal on _ImageUploadViewModalBase, Store {
  late final _$imageUrlAtom =
      Atom(name: '_ImageUploadViewModalBase.imageUrl', context: context);

  @override
  String? get imageUrl {
    _$imageUrlAtom.reportRead();
    return super.imageUrl;
  }

  @override
  set imageUrl(String? value) {
    _$imageUrlAtom.reportWrite(value, super.imageUrl, () {
      super.imageUrl = value;
    });
  }

  late final _$fileAtom =
      Atom(name: '_ImageUploadViewModalBase.file', context: context);

  @override
  File? get file {
    _$fileAtom.reportRead();
    return super.file;
  }

  @override
  set file(File? value) {
    _$fileAtom.reportWrite(value, super.file, () {
      super.file = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: '_ImageUploadViewModalBase.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$downloadTextAtom =
      Atom(name: '_ImageUploadViewModalBase.downloadText', context: context);

  @override
  String get downloadText {
    _$downloadTextAtom.reportRead();
    return super.downloadText;
  }

  @override
  set downloadText(String value) {
    _$downloadTextAtom.reportWrite(value, super.downloadText, () {
      super.downloadText = value;
    });
  }

  late final _$_ImageUploadViewModalBaseActionController =
      ActionController(name: '_ImageUploadViewModalBase', context: context);

  @override
  void imageDownloadUrl(ImageUploadResponse? res) {
    final _$actionInfo = _$_ImageUploadViewModalBaseActionController
        .startAction(name: '_ImageUploadViewModalBase.imageDownloadUrl');
    try {
      return super.imageDownloadUrl(res);
    } finally {
      _$_ImageUploadViewModalBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updateDownloadText(int send, int total) {
    final _$actionInfo = _$_ImageUploadViewModalBaseActionController
        .startAction(name: '_ImageUploadViewModalBase.updateDownloadText');
    try {
      return super.updateDownloadText(send, total);
    } finally {
      _$_ImageUploadViewModalBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeLoading() {
    final _$actionInfo = _$_ImageUploadViewModalBaseActionController
        .startAction(name: '_ImageUploadViewModalBase.changeLoading');
    try {
      return super.changeLoading();
    } finally {
      _$_ImageUploadViewModalBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void saveLocaleFile(XFile? file) {
    final _$actionInfo = _$_ImageUploadViewModalBaseActionController
        .startAction(name: '_ImageUploadViewModalBase.saveLocaleFile');
    try {
      return super.saveLocaleFile(file);
    } finally {
      _$_ImageUploadViewModalBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
imageUrl: ${imageUrl},
file: ${file},
isLoading: ${isLoading},
downloadText: ${downloadText}
    ''';
  }
}
