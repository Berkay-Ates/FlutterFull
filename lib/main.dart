import 'package:flutter/material.dart';
import 'package:master/100/container_sized_learn.dart';
import 'package:master/100/scaffold.learn.dart';
import 'package:master/100/text_learn.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: ScaffoldLearn(),
    );
  }
}
