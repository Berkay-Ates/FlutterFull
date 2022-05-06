import 'package:flutter/material.dart';
import 'package:master/200/state%20mange/state_learn_view_model.dart';

class StateManageLearnView extends StatefulWidget {
  const StateManageLearnView({Key? key}) : super(key: key);

  @override
  State<StateManageLearnView> createState() => _StateManageLearnViewState();
}

class _StateManageLearnViewState extends StateLearnViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () {
        changeOpacity();
        changeVisible();
      }),
      appBar: AppBar(
        title: const Text('Statefull Learn'),
        backgroundColor: isVisible ? Colors.red : Colors.green,
        elevation: 20.0,
        shadowColor: isOpacity ? Colors.amber : Colors.grey,
      ),
      body: null,
    );
  }
}
