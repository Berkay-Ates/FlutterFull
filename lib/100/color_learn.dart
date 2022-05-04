import 'package:flutter/material.dart';

class ColorLearn extends StatelessWidget {
  const ColorLearn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hello World Color Learn'),
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 200,
                width: 300,
                color: ColorValues().porsche,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 200,
                width: 300,
                color: ColorValues().sulu,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                child: Text(
                  'from theme',
                  style: Theme.of(context).textTheme.subtitle2?.copyWith(color: ColorValues().porsche),
                ),
                height: 200,
                width: 300,
                color: Theme.of(context).errorColor,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ColorValues {
  final Color porsche = const Color(0xffEDBF61);
  final Color sulu = const Color.fromRGBO(153, 237, 97, 1.0);
}
