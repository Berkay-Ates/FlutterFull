import 'package:flutter/material.dart';

class WidgetSizeEnumLearnView extends StatefulWidget {
  const WidgetSizeEnumLearnView({Key? key}) : super(key: key);

  @override
  State<WidgetSizeEnumLearnView> createState() => _WidgetSizeEnumLearnViewState();
}

class _WidgetSizeEnumLearnViewState extends State<WidgetSizeEnumLearnView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBar(),
      body: Card(
        child: Container(
          color: Theme.of(context).colorScheme.onSecondary,
          height: WidgetSizes.normalCardHeight.giveValue(),
          width: WidgetSizes.circleProfileWidth.giveValue(),
        ),
      ),
    );
  }
}

enum WidgetSizes { normalCardHeight, circleProfileWidth }

extension WidgetSizeExtension on WidgetSizes {
  double giveValue() {
    switch (this) {
      case WidgetSizes.normalCardHeight:
        return 350;
      case WidgetSizes.circleProfileWidth:
        return 300;
    }
  }
}
