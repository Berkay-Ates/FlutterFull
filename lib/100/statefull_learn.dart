import 'package:flutter/material.dart';
import '../product/Language/language_items.dart';
import '../product/widget/counter_hello_button.dart';

class StatefullLearn extends StatefulWidget {
  const StatefullLearn({Key? key}) : super(key: key);

  @override
  State<StatefullLearn> createState() => _StatefullLearnState();
}

class _StatefullLearnState extends State<StatefullLearn> {
  int _countValue = 0;

  void updateValue(bool isUp) {
    if (isUp) {
      _countValue++;
    } else {
      _countValue--;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    print('Build had called,when you clicked on merhaba');
    return Scaffold(
      appBar: AppBar(
        title: const Text(LanguageItems.welcomeTitle),
      ),
      floatingActionButton: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          increaseButton(),
          decreaseMethod(),
        ],
      ),
      body: Column(
        children: [
          Center(
            child: Text(
              _countValue.toString(),
              style: Theme.of(context).textTheme.headline2,
            ),
          ),
          const Placeholder(),
          const CounterHelloButton(),
        ],
      ),
    );
  }

  FloatingActionButton decreaseMethod() {
    print('Floating decrease');
    return FloatingActionButton(
      onPressed: () {
        updateValue(true);
      },
      child: const Icon(Icons.add),
    );
  }

  FloatingActionButton increaseButton() {
    print('floating increase');
    return FloatingActionButton(
      onPressed: () {
        updateValue(false);
      },
      child: const Icon(Icons.remove),
    );
  }
}
