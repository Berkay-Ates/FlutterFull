import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:master/product/Lottie/lottie_items.dart';
import 'package:master/product/durations/durations.dart';
import 'package:master/product/global/theme_notifier.dart';
import 'package:provider/provider.dart';

class LottieLearn extends StatefulWidget {
  const LottieLearn({Key? key}) : super(key: key);

  @override
  State<LottieLearn> createState() => _LottieLearnState();
}

class _LottieLearnState extends State<LottieLearn> with TickerProviderStateMixin {
  late final AnimationController _controller;
  bool isLight = true;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: DurationItems.durationNormal());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          InkWell(
            onTap: () async {
              await _controller.animateTo(!isLight ? 0.5 : 1);
              isLight = !isLight;
              context.read<ThemeNotifier>().changeTheme();
            },
            child: LottieBuilder.asset(
              LottieItems.changeTemeLottie.lottiePath,
              repeat: false,
              controller: _controller,
            ),
          )
        ],
        title: const Text('lottieLearn'),
      ),
      body: const Center(child: LottieWidget()),
    );
  }
}

class LottieWidget extends StatelessWidget {
  const LottieWidget({
    Key? key,
  }) : super(key: key);
  final lottieUrl = 'https://assets5.lottiefiles.com/packages/lf20_1cazwtnc.json';
  @override
  Widget build(BuildContext context) {
    return Center(child: Lottie.network(lottieUrl));
  }
}
