import 'package:flutter/material.dart';

final kZero = 0;

class AnimatedLearnView extends StatefulWidget {
  const AnimatedLearnView({Key? key}) : super(key: key);

  @override
  State<AnimatedLearnView> createState() => _AnimatedLearnViewState();
}

class _AnimatedLearnViewState extends State<AnimatedLearnView> with TickerProviderStateMixin {
  bool _isVisible = true;
  bool _isOpacity = true;
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: _durationItems.durationSort);
  }

  void _changeOpacity() {
    setState(() {
      _isOpacity = !_isOpacity;
    });
  }

  void _changeVisible() {
    setState(() {
      _isVisible = !_isVisible;
      _controller.animateTo(_isVisible ? 1 : 0);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _animatedCrossFade(),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.chalet),
        onPressed: (() => _changeVisible()),
      ),
      body: Column(
        children: [
          ListTile(
            title: AnimatedOpacity(
              child: const Text('data has animated by animated Opacity'),
              duration: _durationItems.durationSort,
              opacity: _isOpacity ? 1 : 0,
            ),
            trailing: IconButton(
              onPressed: () => _changeOpacity(),
              icon: const Icon(Icons.access_time_filled_outlined),
            ),
          ),
          AnimatedDefaultTextStyle(
              child: const Text('animated Text'),
              style: (_isVisible ? context.textTheme().headline2 : context.textTheme().subtitle1) ?? const TextStyle(),
              duration: _durationItems.durationSort),
          AnimatedIcon(icon: AnimatedIcons.menu_close, progress: _controller),
          AnimatedContainer(
            color: Colors.red,
            duration: _durationItems.durationSort,
            height: _isVisible ? MediaQuery.of(context).size.width * 0.2 : 0,
            width: MediaQuery.of(context).size.height * 0.2,
          )
        ],
      ),
    );
  }

  AnimatedCrossFade _animatedCrossFade() {
    return AnimatedCrossFade(
      firstChild: const Placeholder(),
      secondChild: const SizedBox.shrink(),
      crossFadeState: _isVisible ? CrossFadeState.showFirst : CrossFadeState.showSecond,
      duration: _durationItems.durationLong,
    );
  }
}

extension BuildContextExstension on BuildContext {
  TextTheme textTheme() {
    return Theme.of(this).textTheme;
  }
}

class _durationItems {
  static const durationSort = Duration(seconds: 1);
  static const durationLong = Duration(seconds: 2);
}
