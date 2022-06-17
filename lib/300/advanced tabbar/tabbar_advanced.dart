import 'package:flutter/material.dart';

import '../../100/color_learn.dart';
import '../../100/icon.learn.dart';
import '../../100/indicator_learn.dart';
import '../advanced%20tabbar/tabbar_feed_view.dart';

class TabbarAdvanced2 extends StatefulWidget {
  const TabbarAdvanced2({Key? key}) : super(key: key);

  @override
  State<TabbarAdvanced2> createState() => _TabbarAdvanced2State();
}

class _TabbarAdvanced2State extends State<TabbarAdvanced2> with TickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _initTabController();
  }

  void _initTabController() {
    _tabController = TabController(length: Tabs2.values.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        initialIndex: Tabs2.home.index,
        length: Tabs2.values.length,
        child: Scaffold(
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
          floatingActionButton: FloatingActionButton(
            onPressed: () => _tabController.animateTo(Tabs2.home.index),
            child: const Icon(Icons.home),
          ),
          appBar: AppBar(title: const Text('Second Tabbar')),
          body: TabbarViewAdvanced2(tabController: _tabController),
          bottomNavigationBar: BottomAppBar(
              shape: const CircularNotchedRectangle(),
              notchMargin: 5,
              color: Theme.of(context).colorScheme.error,
              child: _TabbarAdvanced2(tabController: _tabController)),
        ));
  }
}

class TabbarViewAdvanced2 extends StatelessWidget {
  const TabbarViewAdvanced2({
    Key? key,
    required TabController tabController,
  })  : _tabController = tabController,
        super(key: key);

  final TabController _tabController;

  @override
  Widget build(BuildContext context) {
    return TabBarView(
      controller: _tabController,
      children: const [TabbarFeedView(), IconLearn(), IndicatorLearn(), ColorLearn()],
    );
  }
}

class _TabbarAdvanced2 extends StatelessWidget {
  const _TabbarAdvanced2({Key? key, required TabController tabController})
      : _tabController = tabController,
        super(key: key);

  final TabController _tabController;

  @override
  Widget build(BuildContext context) {
    return TabBar(
      onTap: ((value) => null),
      controller: _tabController,
      tabs: Tabs2.values.map((e) => Tab(text: e.name)).toList(),
    );
  }
}

enum Tabs2 { home, settings, favorite, profile }
