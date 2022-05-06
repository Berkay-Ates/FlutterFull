import 'package:flutter/material.dart';
import 'state_manage_view.dart';

abstract class StateLearnViewModel extends State<StateManageLearnView> {
  bool isVisible = true;
  bool isOpacity = true;
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
  }

  void changeOpacity() {
    setState(() {
      isOpacity = !isOpacity;
    });
  }

  void changeVisible() {
    setState(() {
      isVisible = !isVisible;
    });
  }
}


//* baba classı buna extends ettirdik bura içinde de bazı variable'ları ve ilgili fonksiyonlarını 
//* tanımlayarak kodu böldük aslında olan bu : ) 
