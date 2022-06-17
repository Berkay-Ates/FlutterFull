import 'dart:math';

import 'package:flutter/material.dart';

class AnswerButton extends StatefulWidget {
  const AnswerButton({Key? key, this.onNumber}) : super(key: key);

  final bool Function(int randomNumber)? onNumber;
  //? cagrıldıgında ne dondurecek ve parametre olarak ne gerektirecek

  @override
  State<AnswerButton> createState() => _AnswerButtonState();
}

class _AnswerButtonState extends State<AnswerButton> {
  Color? _backgroundColor;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(primary: _backgroundColor),
        onPressed: () {
          //? her tıklanıldığında üstteki fonkdiyon calıstırılıyor ve karşıya içine aldıgı
          //? result parametresini gonderiyor sonra karsıdan bu parametre hakkında bir boolean geliyor.
          final result = Random().nextInt(10);
          final response =
              widget.onNumber?.call(result) ?? false; //? fonksiyon async degil hemen calısıp hemen veri dondurecek
          setState(() {
            response ? _backgroundColor = Colors.green : _backgroundColor = Colors.red;
          });
        },
        child: const Text('hello'));
  }
}
