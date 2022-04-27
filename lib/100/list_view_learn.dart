import 'package:flutter/material.dart';

class ListViewLearn extends StatefulWidget {
  const ListViewLearn({Key? key}) : super(key: key);

  @override
  State<ListViewLearn> createState() => _ListViewLearnState();
}

class _ListViewLearnState extends State<ListViewLearn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: [
          FittedBox(
            child: Text(
              'Merhaba',
              style: Theme.of(context).textTheme.headline1,
            ),
          ),
          const Divider(),
          Container(
            height: 300,
            color: Colors.red,
          ),
          const Divider(),
          SizedBox(
            height: 300,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                Container(
                  width: 150,
                  color: Colors.orange,
                ),
                Divider(),
                Container(
                  width: 200,
                  color: Colors.pink,
                ),
                Divider(),
                Container(
                  width: 200,
                  color: Colors.blue,
                ),
                Divider(),
                Container(
                  width: 200,
                  color: Colors.white,
                )
              ],
            ),
          ),
          const Icon(Icons.close),
        ],
      ),
    );
  }
}
