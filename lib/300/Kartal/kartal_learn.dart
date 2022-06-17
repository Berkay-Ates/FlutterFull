import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import '../../200/image_learn_200.dart';

class KartalLearnView extends StatefulWidget {
  const KartalLearnView({Key? key}) : super(key: key);

  @override
  State<KartalLearnView> createState() => _KartalLearnViewState();
}

class _KartalLearnViewState extends State<KartalLearnView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('kartal package')),
      body: Column(children: [
        InkWell(
            onTap: () => context.navigateToPage(const ImageLearn200(), type: SlideType.TOP),
            child: Text('data', style: context.textTheme.headline1)),
        Icon(!context.isAndroidDevice ? Icons.android : Icons.apple),
        AnimatedContainer(duration: context.durationLow, height: context.isKeyBoardOpen ? 0 : 150, color: Colors.red),
        const TextField(),
        Image.network('src'.randomImage),
        InkWell(
            onTap: () => 'atesberkay2356@gmail.com'.launchEmail,
            child: Text('launch Email', style: context.textTheme.headline4)),
      ]),
    );
  }
}
