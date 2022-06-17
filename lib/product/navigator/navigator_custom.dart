import 'dart:developer';
import 'package:flutter/material.dart';
import '../../300/Navigation/navigata_home_view.dart';
import '../../300/Navigation/navigate_home_detail_view.dart';
import '../../300/lottieLearn/lottie.dart';
import 'navigator_roots.dart';

import '../../main.dart';

mixin NavigatorCustom<T extends MyApp> on Widget {
  Route<dynamic>? onGenerateRoute(RouteSettings routeSettings) {
    //inspect(routeSettings.name);

    if (routeSettings.name?.isEmpty ?? true) {
      //* name de herhangi bir sıkıntı olursa direk lottie yolluyoruz
      return _navigateToNormal(const LottieLearn());
    }

    if (routeSettings.name == NavigatorRoots.paragf) {
      inspect(routeSettings.name);
      print('here');
      return _navigateToNormal(const LottieLearn());
    }

    final _routes = RootNames.values.byName(routeSettings.name!.substring(1));
    //* rootSettingsten felen değerin enum listesindeki karsılıgını bulduk

    switch (_routes) {
      case RootNames.home:
        return _navigateToNormal(const NavigatorHomeView());
      case RootNames.homeDetail:
        final _id = routeSettings.arguments;
        return _navigateToNormal(NavigatorHomeDetailView(id: _id is String ? _id : null), isFullScreenDialog: true);
      case RootNames.profile:
        // TODO: Handle this case.
        break;
    }

    return null;
  }

  Route<dynamic>? _navigateToNormal(Widget child, {bool? isFullScreenDialog}) {
    return MaterialPageRoute(
      fullscreenDialog: isFullScreenDialog ?? false,
      builder: ((context) => child),
    );
  }
}
