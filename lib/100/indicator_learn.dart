import 'package:flutter/material.dart';

class IndicatorLearn extends StatelessWidget {
  const IndicatorLearn({Key? key}) : super(key: key);
  final String _appbarTitle = 'Indicator';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_appbarTitle),
        actions: const [CenterProgressIndicator()],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Center(child: CenterProgressIndicator()),
          SizedBox(
            height: 25,
          ),
          LinearProgressIndicator()
        ],
      ),
    );
  }
}

class CenterProgressIndicator extends StatelessWidget {
  const CenterProgressIndicator({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(child: CircularProgressIndicator());
  }
}
