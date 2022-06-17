import 'package:flutter/material.dart';
import 'icon.learn.dart';
import 'image_learn.dart';
import 'stack_learn.dart';

class PageViewLearn extends StatefulWidget {
  const PageViewLearn({Key? key}) : super(key: key);

  @override
  State<PageViewLearn> createState() => _PageViewLearnState();
}

class _PageViewLearnState extends State<PageViewLearn> {
  final PageController _controller = PageController(viewportFraction: 0.9);
  int _currentPage = 0;

  void updatePageIndex(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    print('build called');
    return Scaffold(
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            _currentPage.toString(),
            style: Theme.of(context).textTheme.headline3,
          ),
          FloatingActionButton(
            onPressed: (() {
              _controller.previousPage(duration: const Duration(seconds: 1), curve: Curves.ease);
            }),
            child: const Icon(
              Icons.chevron_left,
            ),
          ),
          FloatingActionButton(
            onPressed: (() {
              _controller.nextPage(duration: const Duration(seconds: 1), curve: Curves.ease);
            }),
            child: const Icon(
              Icons.chevron_right,
            ),
          ),
        ],
      ),
      appBar: AppBar(),
      body: PageView(
        padEnds: false,
        controller: _controller,
        onPageChanged: updatePageIndex,
        children: [
          const ImageLearn(),
          const IconLearn(),
          const StackLearn(),
          Container(
            color: Colors.red,
          ),
          Container(
            color: Colors.green,
          ),
          Container(
            color: Colors.orange,
          ),
        ],
      ),
    );
  }
}
