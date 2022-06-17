import 'package:flutter/material.dart';

class PaddingLearn extends StatelessWidget {
  const PaddingLearn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Padding Learn')),
      body: Column(
        children: [
          Padding(
            padding: ProjectPaddings.pagePaddingVertical,
            child:
                Container(height: 60, color: Theme.of(context).disabledColor),
          ),
          Padding(
            padding: ProjectPaddings.pagePaddingVertical +
                const EdgeInsets.only(left: 50),
            child:
                Container(height: 60, color: Theme.of(context).disabledColor),
          ),
        ],
      ),
    );
  }
}

//* Paddinglerin + operatörleri syesinde farklı farklı paddingleri toplayarak yeni padding değeri oluşturabiliriz

class ProjectPaddings {
  static const pagePaddingVertical = EdgeInsets.symmetric(vertical: 10);

  static const pagePaddingRightOnly = EdgeInsets.only(right: 20);
}
