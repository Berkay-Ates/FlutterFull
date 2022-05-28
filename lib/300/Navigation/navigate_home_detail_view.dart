import 'dart:developer';

import 'package:flutter/material.dart';

class NavigatorHomeDetailView extends StatefulWidget {
  const NavigatorHomeDetailView({Key? key, this.id}) : super(key: key);
  final String? id;

  @override
  State<NavigatorHomeDetailView> createState() => _NavigatorHomeDetailView();
}

class _NavigatorHomeDetailView extends State<NavigatorHomeDetailView> {
  String? _id;
  late final _model;
  @override
  void initState() {
    super.initState();
    _id = widget.id;
    if (_id == null) {
      Future.microtask(() {
        _model = ModalRoute.of(context)?.settings.arguments;
        inspect(_model);
        setState(() {
          _model is String ? _id = _model : _id = widget.id;
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_id ?? 'Nothing to Show')),
    );
  }
}
