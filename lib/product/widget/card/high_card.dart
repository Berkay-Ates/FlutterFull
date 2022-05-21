import 'package:flutter/material.dart';

class HighCard extends StatelessWidget {
  const HighCard({Key? key, required this.item}) : super(key: key);

  final List<String> item;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        item.join('-'),
        style: Theme.of(context).textTheme.headline3,
      ),
    );
  }
}
