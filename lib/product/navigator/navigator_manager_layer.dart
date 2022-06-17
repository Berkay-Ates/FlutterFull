import 'package:flutter/material.dart';

import 'navigator_roots.dart';

class MyNavigatorManager {
  //? Classı sıngleton'a cekince icindeki _navigator key propertysi de otomatik olarak sadece 1 defa
  //? uretilebilir hale geldi.
  MyNavigatorManager._();
  static MyNavigatorManager instance = MyNavigatorManager._();
  final GlobalKey<NavigatorState> _navigatorGlobalKey = GlobalKey();

  GlobalKey<NavigatorState> get navigatorGlobalKey => _navigatorGlobalKey;

  void pushToPage(RootNames root, {dynamic? arguments}) {
    _navigatorGlobalKey.currentState?.pushNamed(root.withParaf, arguments: arguments);
  }
}
