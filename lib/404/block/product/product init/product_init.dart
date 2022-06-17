import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import '../../../../product/global/resource_context.dart';
import '../../../../product/global/theme_notifier.dart';
import '../init/localization_init.dart';

class ProductInit {
  final LocalizationInit localization = LocalizationInit();

  final List<SingleChildWidget> providers = [
    Provider(create: (_) => ResourceContext()),
    ChangeNotifierProvider(create: ((context) => ThemeNotifier())),
  ];

  Future<void> init() async {
    WidgetsFlutterBinding.ensureInitialized();
    await EasyLocalization.ensureInitialized();
  }
}
