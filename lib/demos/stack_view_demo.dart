import 'package:flutter/material.dart';

import '../core/random_image.dart';

class StackViewDemo extends StatelessWidget {
  const StackViewDemo({Key? key}) : super(key: key);
  final double _cardHeight = 50;
  final double _cardWidth = 200;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stack Demo'),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 4,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Positioned.fill(
                  bottom: _cardHeight / 2,
                  child: const RandomImage(),
                ),
                Positioned(
                  height: _cardHeight,
                  width: _cardWidth,
                  bottom: 0,
                  child: _cardCustom(),
                )
              ],
            ),
          ),
          const Spacer(
            flex: 6,
          ),
        ],
      ),
    );
  }
}

class _cardCustom extends StatelessWidget {
  const _cardCustom({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(),
    );
  }
}
