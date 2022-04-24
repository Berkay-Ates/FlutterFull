import 'package:flutter/material.dart';

class ButtonLearn extends StatelessWidget {
  const ButtonLearn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          TextButton(
            onPressed: () => null,
            child: Text('Hello World'),
          ),
          ElevatedButton(
            onPressed: () => null,
            child: const Text('elevated button'),
          ),
          IconButton(
            onPressed: () => null,
            icon: const Icon(Icons.account_balance_wallet_sharp),
          ),
          OutlinedButton(
            onPressed: () => null,
            child: const Text('hello world'),
            style: OutlinedButton.styleFrom(
              backgroundColor: Colors.amberAccent,
              padding: const EdgeInsets.all(25),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  top: Radius.zero,
                  bottom: Radius.circular(20),
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () => null,
            child: const Padding(
              padding: EdgeInsets.all(18.0),
              child: Text('this is an inkwell button'),
            ),
          ),
          ElevatedButton(
            onPressed: () => null,
            style: ElevatedButton.styleFrom(
              primary: Colors.black,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 40.0, right: 40.0, top: 20.0, bottom: 20.0),
              child: Text(
                'Hello World',
                style: Theme.of(context).textTheme.headline4,
              ),
            ),
          )
        ],
      ),
    );
  }
}
