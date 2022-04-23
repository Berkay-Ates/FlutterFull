import 'package:flutter/material.dart';

class IconLearn extends StatelessWidget {
  const IconLearn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hello World'),
      ),
      body: Column(
        children: [
          Icon(
            Icons.account_tree_sharp,
            size: IconValues.size,
            color: IconValues.colors,
          ),
          SizedBox(
            height: 100,
          ),
          Icon(
            Icons.dns_outlined,
            size: IconValues.size,
            color: Theme.of(context).backgroundColor,
          ),
        ],
      ),
    );
  }
}

class IconValues {
  static double size = 65;
  static Color colors = Color(0xffA92B4F);
}
