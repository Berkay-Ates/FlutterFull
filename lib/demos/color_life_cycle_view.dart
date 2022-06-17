import 'package:flutter/material.dart';

import 'color_demos_view.dart';

class ColorLifeCycleView extends StatefulWidget {
  const ColorLifeCycleView({Key? key}) : super(key: key);

  @override
  State<ColorLifeCycleView> createState() => _ColorLifeCycleViewState();
}

class _ColorLifeCycleViewState extends State<ColorLifeCycleView> {
  Color? _backgroundColor;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                setState(() {
                  _backgroundColor = Colors.pink;
                  //?  sayfa ilk oluşturuldugunda null gidiyor sonra buraya tıklandıgında giden renk pink oluyor
                });
              },
              icon: const Icon(Icons.clear))
        ],
      ),
      body: Column(
        children: [
          const Spacer(),
          Expanded(
              child: ColorDemosView(
            initialColor: _backgroundColor,
          ))
        ],
      ),
    );
  }
}
