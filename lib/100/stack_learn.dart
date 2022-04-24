import 'package:flutter/material.dart';

class StackLearn extends StatelessWidget {
  const StackLearn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Stack Learn')),
      body: Stack(
        children: [
          Container(height: 100, color: Colors.red),
          Padding(
            padding: EdgeInsets.only(top: 50),
            child: Container(height: 100, color: Colors.blue),
          ),
          Positioned(
            top: 25,
            left: 0,
            right: 0,
            child: Container(height: 100, color: Colors.green),
          )
        ],
      ),
    );
  }
}
