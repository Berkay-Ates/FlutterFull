import 'package:flutter/material.dart';

class NavigatorProfileView extends StatefulWidget {
  const NavigatorProfileView({Key? key}) : super(key: key);

  @override
  State<NavigatorProfileView> createState() => _NavigatorProfileView();
}

class _NavigatorProfileView extends State<NavigatorProfileView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile View'),
      ),
    );
    ;
  }
}
