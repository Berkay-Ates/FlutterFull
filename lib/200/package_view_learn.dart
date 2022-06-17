import 'package:flutter/material.dart';
import 'package/launch_manager.dart';
import 'package/loading_bar.dart';

class PackageViewLearn extends StatefulWidget {
  const PackageViewLearn({Key? key}) : super(key: key);

  @override
  State<PackageViewLearn> createState() => _PackageViewLearnState();
}

class _PackageViewLearnState extends State<PackageViewLearn> with TickerProviderStateMixin, LaunchMixin {
  final Uri _url = Uri.parse('https://google.com');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).buttonTheme.colorScheme?.onSecondary,
        onPressed: () => launchURL(_url),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'data',
            style: Theme.of(context).textTheme.subtitle1,
          ),
          LoadingBar(),
        ],
      ),
    );
  }
}
