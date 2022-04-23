import 'package:flutter/material.dart';

class ContainerSizedBoxLearn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('learn'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: 300,
              width: 300,
              child: Text('a' * 5000),
            ),
          ),
          const SizedBox.shrink(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox.square(
              dimension: 150,
              child: Text(
                'a' * 2000,
                overflow: TextOverflow.fade,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              child: Text('w' * 93),
              decoration: ProjectContainerDecoration(),
            ),
          ),
        ],
      ),
    );
  }
}

class ProjectContainerDecoration extends BoxDecoration {
  ProjectContainerDecoration()
      : super(
          //color: Colors.amberAccent,
          gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.green, Colors.orange],
          ),
          boxShadow: const [
            BoxShadow(
              color: Colors.blueAccent,
              offset: Offset(
                0.1,
                1.0,
              ),
              blurRadius: 0.1,
            ),
          ],
          border: Border.all(width: 10),
          borderRadius: const BorderRadius.all(
            Radius.circular(18),
          ),
        );
}
