import 'package:flutter/material.dart';

class ColorDemosView extends StatefulWidget {
  const ColorDemosView({
    Key? key,
    required this.initialColor,
  }) : super(key: key);
  final Color? initialColor;

  @override
  State<ColorDemosView> createState() => _ColorDemosViewState();
}

class _ColorDemosViewState extends State<ColorDemosView> {
  Color? _backgroundColor;

  void _changeColor(Color color) {
    setState(() {
      _backgroundColor = color;
    });
  }

  @override
  void didUpdateWidget(covariant ColorDemosView oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.initialColor != _backgroundColor && _backgroundColor != null) {
      //? üstteki widget gelen renk propertysini güncellediginde güncellenmeden önceki renk değeri
      //? ile güncellendikten sonraki renk değeri farklıysa demekki renk değişmiştir
      //? rengi en tepedeki widget'ten çekiyoruz
      _changeColor(widget.initialColor!);
    }
  }

  @override
  void initState() {
    _backgroundColor = widget.initialColor ?? Colors.transparent;
    //* gelen color null ise otomatik olarak transparent renk olarak background colour'u oluştur.
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print('build called');
    return Scaffold(
      backgroundColor: _backgroundColor,
      appBar: AppBar(),
      bottomNavigationBar: BottomNavigationBar(onTap: _colorOnTap, items: const [
        BottomNavigationBarItem(icon: _colorContainer(color: Colors.red), label: 'red'),
        BottomNavigationBarItem(icon: _colorContainer(color: Colors.yellow), label: 'yellow'),
        BottomNavigationBarItem(icon: _colorContainer(color: Colors.blue), label: 'blue')
      ]),
    );
  }

  void _colorOnTap(value) {
    if (value == _MyColors.red.index) {
      _changeColor(Colors.red);
    } else if (value == _MyColors.yellow.index) {
      _changeColor(Colors.yellow);
    } else if (value == _MyColors.blue.index) {
      _changeColor(Colors.blue);
    }
  }
}

enum _MyColors { red, yellow, blue }

class _colorContainer extends StatelessWidget {
  const _colorContainer({
    Key? key,
    required this.color,
  }) : super(key: key);
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 10,
      width: 10,
      color: color,
    );
  }
}
