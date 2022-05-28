import 'package:flutter/cupertino.dart';

import '../../300/Navigation/navigata_home_view.dart';
import '../../300/Navigation/navigate_home_detail_view.dart';
import '../../300/Navigation/navigate_profile_view.dart';
import '../../300/lottieLearn/lottie.dart';

class NavigatorRoots {
  static const paragf = "/";

  NavigatorRoots._() {
    _routes = {
      paragf: (context) => const LottieLearn(),
      RootNames.home.withParaf: (context) => const NavigatorHomeView(),
      RootNames.homeDetail.withParaf: (context) => const NavigatorHomeDetailView(),
      RootNames.profile.withParaf: (context) => const NavigatorProfileView(),
    };
  }

  late final Map<String, WidgetBuilder> _routes;

  static final NavigatorRoots instance = NavigatorRoots._();
  Map<String, WidgetBuilder> get routes => _routes;
}

enum RootNames { home, homeDetail, profile }

extension RootNamesExstension on RootNames {
  String get withParaf => '/$name';
}
