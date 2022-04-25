import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFieldLearn extends StatefulWidget {
  const TextFieldLearn({Key? key}) : super(key: key);

  @override
  State<TextFieldLearn> createState() => _TextFieldLearnState();
}

class _TextFieldLearnState extends State<TextFieldLearn> {
  FocusNode _focusNodeOne = FocusNode();
  FocusNode _focusNodeOne2 = FocusNode();
  @override
  Widget build(BuildContext context) {
    print('Build called');
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          TextField(
            focusNode: _focusNodeOne,
            maxLength: 100,
            buildCounter: (BuildContext context, {int? currentLength, bool? isFocused, int? maxLength}) {
              return AnimatedContainer(
                height: 15,
                width: 100,
                color: Colors.green[50 * (currentLength ?? 0)],
                duration: const Duration(seconds: 1),
              );
            },
            inputFormatters: [TextProjectInputFormatter()._formatter],
            textInputAction: TextInputAction.next,
            decoration: InputDecorators()._emailInput,
          ),
          TextField(
            focusNode: _focusNodeOne2,
          )
        ],
      ),
    );
  }
}

class TextFieldAnimatedContainer extends StatelessWidget {
  const TextFieldAnimatedContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      height: 15,
      width: 100,
      //color: Colors.green[50 * (currentLength ?? 0)],
      duration: const Duration(seconds: 1),
    );
  }
}

class TextProjectInputFormatter {
  final _formatter = TextInputFormatter.withFunction((oldValue, newValue) {
    if (newValue.text == 'a') {
      return newValue;
    }
    return newValue;
  });
}

class InputDecorators {
  final _emailInput = const InputDecoration(
    prefix: Icon(Icons.mail),
    border: OutlineInputBorder(),
    labelText: 'Mail',
  );
}
