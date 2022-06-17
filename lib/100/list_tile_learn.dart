import 'package:flutter/material.dart';

import '../core/random_image.dart';

class ListTileLearn extends StatelessWidget {
  const ListTileLearn({Key? key}) : super(key: key);
  final String _data = 'List Tile Learn';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_data),
      ),
      body: Padding(
        padding: _PaddingItems.scaffoldPadding,
        child: Card(
          child: ListTile(
            leading: Text('Leading'),
            onTap: () {},
            trailing: Text('Trailing'),
            subtitle: Text('Subtitle'),
            title: RandomImage(),
          ),
        ),
      ),
    );
  }
}

class _PaddingItems {
  static const scaffoldPadding = EdgeInsets.symmetric(horizontal: 10.0);
}
