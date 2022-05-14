import 'dart:developer';

import 'package:flutter/material.dart';

class AlertLearn extends StatefulWidget {
  const AlertLearn({Key? key}) : super(key: key);

  @override
  State<AlertLearn> createState() => _AlertLearnState();
}

class _AlertLearnState extends State<AlertLearn> with _ShowMyDialogs {
  Color _backgroundColor = Colors.grey;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _backgroundColor,
      appBar: AppBar(title: const Text('Altert Learn')),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final response = await _showDialog(context);
          inspect(response);
          response ? _backgroundColor = Colors.green : _backgroundColor = Colors.red;
          setState(() {});
        },
        child: const Icon(Icons.account_circle_sharp),
      ),
    );
  }
}

mixin _ShowMyDialogs {
  Future<T?> _showDialog<T>(BuildContext context) async {
    return await showDialog<T>(
        barrierDismissible: false, context: context, builder: (context) => const _CustomAlertdialog());
  }
}

class _CustomAlertdialog extends StatelessWidget {
  const _CustomAlertdialog({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text(' version update'),
      actions: [
        ElevatedButton(onPressed: () => Navigator.of(context).pop<bool>(true), child: const Text('update')),
        MaterialButton(onPressed: () => Navigator.of(context).pop<bool>(false), child: const Text('close')),
      ],
    );
  }
}

class CustomAlert extends AlertDialog {
  CustomAlert({Key? key, required BuildContext context})
      : super(
          key: key,
          title: const Text(' version update'),
          actions: [
            ElevatedButton(onPressed: () => Navigator.of(context).pop<bool>(true), child: const Text('update')),
            MaterialButton(onPressed: () => Navigator.of(context).pop<bool>(false), child: const Text('close')),
          ],
        );
}
