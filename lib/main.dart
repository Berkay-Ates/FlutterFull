import 'package:flutter/cupertino.dart';
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
import 'package:master/100/list_view_builder.learn.dart';
import 'package:master/100/list_view_learn.dart';
import 'package:master/100/navigation_learn.dart';
import 'package:master/100/scaffold.learn.dart';
import 'package:master/100/stack_learn.dart';
import 'package:master/100/statefull_learn.dart';
import 'package:master/100/statefull_lifecycle_learn.dart';
import 'package:master/100/stateless_learn.dart';
import 'package:master/100/text_field_learn.dart';
import 'package:master/100/text_learn.dart';
import 'package:master/200/form_learn_view.dart';
import 'package:master/200/service/comments_learn_view.dart';
import 'package:master/200/service/service_learn_view.dart';
import 'package:master/200/service/service_post_learn_view.dart';
import 'package:master/200/theme/light_theme.dart';
import 'package:master/demos/color_demos_view.dart';
import 'package:master/demos/color_life_cycle_view.dart';
import 'package:master/demos/my_collections_demo.dart';
import 'package:master/demos/note_demos_view.dart';
import 'package:master/demos/stack_view_demo.dart';
import '100/indicator_learn.dart';
import '100/list_tile_learn.dart';
import '100/padding_learn.dart';
import '100/page_view_learn.dart';
import '200/animated_learn_view.dart';
import '200/cache/secure context/secure_context.dart';
import '200/cache/shared_learn_cache.dart';
import '200/cache/shared_list_cache.dart';
import '200/image_learn_200.dart';
import '200/mini oop/oop_learn_view.dart';
import '200/package_view_learn.dart';
import '200/password_texrfield.dart';
import '200/state mange/state_manage_view.dart';
import '200/tab_learn.dart';
import '200/theme_learn_view.dart';
import '200/widget_size_enum_learn_view.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      theme: LightTheme().theme,
      // ThemeData.dark().copyWith(
      //   bottomAppBarTheme: const BottomAppBarTheme(shape: CircularNotchedRectangle()),
      //   tabBarTheme: const TabBarTheme(
      //     labelColor: Colors.white,
      //     unselectedLabelColor: Colors.red,
      //     indicatorSize: TabBarIndicatorSize.label,
      //   ),
      //   progressIndicatorTheme: const ProgressIndicatorThemeData(
      //     color: Color.fromARGB(255, 233, 9, 54),
      //   ),
      //   appBarTheme: const AppBarTheme(
      //     backgroundColor: Colors.transparent,
      //     elevation: 0,
      //     centerTitle: true,
      //   ),
      //   errorColor: ColorValues().sulu,
      // ),
      home: const SecureContextView(),
    );
  }
}
