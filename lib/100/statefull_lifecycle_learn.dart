import 'package:flutter/material.dart';

class StatefullLifecycleLearn extends StatefulWidget {
  const StatefullLifecycleLearn({
    Key? key,
    required this.title,
  }) : super(key: key);
  final String title;

  @override
  State<StatefullLifecycleLearn> createState() => _StatefullLifecycleLearnState();
}

class _StatefullLifecycleLearnState extends State<StatefullLifecycleLearn> {
  String _message = '';
  late bool _isOdd;

  @override
  void initState() {
    super.initState();
    _message = widget.title;
    _isOdd = widget.title.length.isOdd;
    _computeName();
  }

  void _computeName() {
    if (_isOdd) {
      _message += ' TEK';
    } else {
      _message += ' CIFT';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_message)),
      body: widget.title.length.isOdd
          ? TextButton(onPressed: () => null, child: Text(_message))
          : ElevatedButton(onPressed: () => null, child: Text(_message)),
    );
  }
}
