import 'package:flutter/material.dart';
import 'package:master/100/appbar_learn.dart';
import 'package:master/100/button_learn.dart';
import 'package:master/100/card_learn.dart';
import 'package:master/100/color_learn.dart';
import 'package:master/100/column_row_learn.dart';
import 'package:master/100/container_sized_learn.dart';
import 'package:master/100/custom_component_learn.dart';
import 'package:master/100/icon.learn.dart';
import 'package:master/100/image_learn.dart';
import 'package:master/100/scaffold.learn.dart';
import 'package:master/100/stack_learn.dart';
import 'package:master/100/stateless_learn.dart';
import 'package:master/100/text_learn.dart';
import 'package:master/demos/note_demos_view.dart';
import 'package:master/demos/stack_view_demo.dart';
import '100/indicator_learn.dart';
import '100/list_tile_learn.dart';
import '100/padding_learn.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        progressIndicatorTheme: const ProgressIndicatorThemeData(
          color: Color.fromARGB(255, 233, 9, 54),
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
        ),
        errorColor: ColorValues().sulu,
      ),
      home: const StackViewDemo(),
    );
  }
}
