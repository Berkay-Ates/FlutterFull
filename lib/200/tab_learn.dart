import 'package:flutter/material.dart';
import 'package:master/100/color_learn.dart';
import 'package:master/100/icon.learn.dart';
import 'package:master/100/image_learn.dart';
import 'package:master/100/indicator_learn.dart';

class TabLearn extends StatefulWidget {
  const TabLearn({Key? key}) : super(key: key);

  @override
  State<TabLearn> createState() => _TabLearnState();
}

class _TabLearnState extends State<TabLearn> with TickerProviderStateMixin {
  late final TabController _tabController;
  final double _notchedMargin = 10;

  @override
  void initState() {
    super.initState();

    _tabController = TabController(length: _MyTabViews.values.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: _MyTabViews.values.length,
        child: Scaffold(
            appBar: AppBar(
                // bottom: const TabBar(tabs: [Tab(text: 'Tab 1'), Tab(text: 'Tab 2')]),
                ),
            extendBody: true,
            floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
            floatingActionButton: FloatingActionButton(
              onPressed: (() {
                _tabController.animateTo(_MyTabViews.home.index);
              }),
            ),
            bottomNavigationBar: BottomAppBar(
              notchMargin: _notchedMargin,
              child: _myTabView(),
            ),
            body: _tabbarView()));
  }

  TabBar _myTabView() {
    return TabBar(
        onTap: (int index) => null,
        controller: _tabController,
        tabs: _MyTabViews.values.map((e) => Tab(text: e.name)).toList());
  }

  TabBarView _tabbarView() {
    return TabBarView(
      physics: const NeverScrollableScrollPhysics(),
      controller: _tabController,
      children: const [ImageLearn(), IconLearn(), IndicatorLearn(), ColorLearn()],
    );
  }
}

enum _MyTabViews { home, settings, favorite, profile }

//? Exstension yazma zehri
extension _MyTabViewExtension on _MyTabViews {}
