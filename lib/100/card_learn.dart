import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class CardLearn extends StatelessWidget {
  const CardLearn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Card Learn'),
      ),
      body: Column(
        children: const [
          Card(
            elevation: 0, //? elevation card componentinin html deki z indexi gibidir
            margin: ProjectMargins.cardMargin,
            //! shape: StadiumBorder(),
            //! shape: CircleBorder(),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(12))),
            child: SizedBox(
              height: 150,
              width: 250,
            ),
          ),
          _CustomContainer(
            title: 'hello there',
          ),
          Card(
            child: SizedBox(
              height: 150,
              width: 150,
            ),
          )
        ],
      ),
    );
  }
}

class _CustomContainer extends StatelessWidget {
  const _CustomContainer({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0, //? elevation card componentinin html deki z indexi gibidir
      margin: ProjectMargins.cardMargin,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(12),
        ),
      ),
      child: SizedBox(
        child: Text(title),
        height: 150,
        width: 250,
      ),
    );
  }
}

class ProjectMargins {
  static const cardMargin = EdgeInsets.all(10);
}
