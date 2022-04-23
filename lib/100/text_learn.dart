import 'package:flutter/material.dart';

class TextLearnView extends StatelessWidget {
  String? userName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                Texts.text1 * 15,
                style: Texts.kText1Style,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                Texts.text1 * 15,
                style: Texts.kText1Style,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                Texts.text1 * 15,
                style: Theme.of(context)
                    .textTheme
                    .headline4
                    ?.copyWith(color: Colors.red, fontSize: 33.0),
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                userName == null ? 'null' : userName ?? 'wth' * 10,
                // null ifadeler üzerinde nullcheck Operatoru kullanabiliriz
                style: Theme.of(context)
                    .textTheme
                    .headline4
                    ?.copyWith(color: Colors.red, fontSize: 33.0),
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Texts {
  static const text1 = 'Buy the best one';
  static const kText1Style = TextStyle(decoration: TextDecoration.underline);
}
