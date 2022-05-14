import 'package:flutter/material.dart';

class myStatefullWidget extends StatefulWidget {
  myStatefullWidget({Key? key}) : super(key: key);

  @override
  State<myStatefullWidget> createState() => _myStatefullWidgetState();
}

class _myStatefullWidgetState extends statefullVidgetModelView {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}

abstract class statefullVidgetModelView extends State<myStatefullWidget> {}
