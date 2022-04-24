import 'package:flutter/material.dart';

class StatlessLearn extends StatelessWidget {
  const StatlessLearn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hello World'),
      ),
      body: Column(
        children: [
          TitleWidget(title: 'deneme1'),
          TitleWidget(title: 'deneme2'),
          TitleWidget(title: 'deneme3'),
          TitleWidget(title: 'deneme4'),
          TitleWidget(title: 'deneme5'),
          TitleWidget(title: 'deneme6'),
          TitleWidget(title: 'deneme7'),
          TitleWidget(title: 'deneme8'),
          _FilePrivateContainer(description: 'Private Container'),
        ],
      ),
    );
  }
}

class _FilePrivateContainer extends StatelessWidget {
  _FilePrivateContainer({
    this.description,
    Key? key,
  }) : super(key: key);

  String? description;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 100,
        width: 150,
        color: Theme.of(context).colorScheme.errorContainer,
        child: Text(description ?? 'it is null amk'),
      ),
    );
  }
}

class TitleWidget extends StatelessWidget {
  TitleWidget({Key? key, required this.title}) : super(key: key);

  final String title;
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: Theme.of(context).textTheme.headline3,
    );
  }
}
