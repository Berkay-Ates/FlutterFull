import 'package:flutter/material.dart';
import 'package:master/100/appbar_learn.dart';
import 'package:master/100/button_learn.dart';
import 'package:master/100/card_learn.dart';
import 'package:master/100/color_learn.dart';
import 'package:master/100/container_sized_learn.dart';
import 'package:master/100/icon.learn.dart';
import 'package:master/100/image_learn.dart';
import 'package:master/100/scaffold.learn.dart';
import 'package:master/100/stateless_learn.dart';
import 'package:master/100/text_learn.dart';
import 'package:master/demos/note_demos_view.dart';
import '100/padding_learn.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        appBarTheme: const AppBarTheme(
            backgroundColor: Colors.transparent,
            elevation: 0,
            centerTitle: true),
        errorColor: ColorValues().sulu,
      ),
      home: const NoteDemosView(),
    );
  }
}
