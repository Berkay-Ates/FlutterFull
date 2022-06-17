import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'product/global/theme_notifier.dart';
import 'product/navigator/navigator_custom.dart';
import 'product/navigator/navigator_manager_layer.dart';
import 'package:provider/provider.dart';
import '300/lottieLearn/lottie.dart';
import '404/block/compute/compute_learn.dart';
import '404/block/product/product init/product_init.dart';

void main() async {
  final ProductInit _productInit = ProductInit();
  await _productInit.init();

  runApp(
    EasyLocalization(
      supportedLocales: _productInit.localization.supportedLocale,
      path: _productInit.localization.path, // <-- change the path of the translation files

      child: MultiProvider(
        providers: _productInit.providers,
        builder: (context, child) => MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget with NavigatorCustom {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      theme: context.watch<ThemeNotifier>().currentTheme, //? burada theme Data getter ile gelmesi lazım
      //? herhangi bir fonksiyon çalıştırtarak theme de return edilen fonksiyoından theme'i okuyamayız.

      //* builder methodu kullanımı

      builder: (context, child) {
        return MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0), child: child ?? const SizedBox.shrink());
      },
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
      onUnknownRoute: (settings) => MaterialPageRoute(builder: ((context) => const LottieLearn())),
      //routes: NavigatorRoots.instance.routes,
      onGenerateRoute: onGenerateRoute,
      navigatorKey: MyNavigatorManager.instance.navigatorGlobalKey,
      home: const ComputeLearn(),
    );
  }
}
