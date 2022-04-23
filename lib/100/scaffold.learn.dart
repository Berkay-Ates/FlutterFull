import 'package:flutter/material.dart';
import 'package:master/100/container_sized_learn.dart';

class ScaffoldLearn extends StatelessWidget {
  const ScaffoldLearn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Appbar'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => null,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: const Text('Hello World'),
      bottomNavigationBar: Container(
        decoration: ProjectContainerDecoration(),
        child: BottomNavigationBar(items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.abc_rounded), label: 'item1'),
          BottomNavigationBarItem(
              icon: Icon(Icons.abc_outlined), label: 'item2')
        ]),
      ),
    );
  }
}
