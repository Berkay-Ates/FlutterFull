import 'package:flutter/material.dart';

part './part_appbar.dart';

class PartPartOfLearn extends StatefulWidget {
  const PartPartOfLearn({Key? key}) : super(key: key);

  @override
  State<PartPartOfLearn> createState() => _PartPartOfLearnState();
}

class _PartPartOfLearnState extends State<PartPartOfLearn> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(appBar: _PartOfWidget());
  }
}
