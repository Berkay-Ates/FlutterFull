import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ComputeLearn extends StatefulWidget {
  const ComputeLearn({Key? key}) : super(key: key);
  @override
  State<ComputeLearn> createState() => _ComputeLearnViewState();
}

class _ComputeLearnViewState extends State<ComputeLearn> {
  int _result = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: CircularProgressIndicator(color: Theme.of(context).colorScheme.secondary)),
      floatingActionButton: FloatingActionButton(
        onPressed: (() async {
          final futureresult = await compute(Calculator.calculate, 1009999999999000000);
          setState(() {
            _result = futureresult;
          });
        }),
        child: const Icon(Icons.hotel_class_outlined),
      ),
      body: Container(
        child: Text(_result.toString()),
      ),
    );
  }
}

class Calculator {
  static int calculate(int limit) {
    int i = 0;
    for (i = 0; i < limit; i++) {
      i += i;
    }
    return i;
  }
}
