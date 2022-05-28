import 'package:flutter/material.dart';
import 'package:master/product/navigator/navigator_manager_layer.dart';
import 'package:master/product/navigator/navigator_roots.dart';

class NavigatorHomeView extends StatefulWidget {
  const NavigatorHomeView({Key? key}) : super(key: key);

  @override
  State<NavigatorHomeView> createState() => _NavigatorHomeView();
}

class _NavigatorHomeView extends State<NavigatorHomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home View'),
      ),
      floatingActionButton: FloatingActionButton.large(
        onPressed: () {
          MyNavigatorManager.instance.pushToPage(RootNames.homeDetail, arguments: 'Comes from the Home Page');
          //context.navigatorState.pushNamed(RootNames.homeDetail.withParaf, arguments: "Cames from HomeView");
        },
        child: const Icon(Icons.abc_outlined),
      ),
    );
  }
}

extension NavigateExstension on BuildContext {
  NavigatorState get navigatorState => Navigator.of(this);
}
