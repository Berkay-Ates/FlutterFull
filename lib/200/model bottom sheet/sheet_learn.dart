import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:master/200/image_learn_200.dart';

class SheetLearn extends StatefulWidget {
  const SheetLearn({Key? key}) : super(key: key);

  @override
  State<SheetLearn> createState() => _SheetLearnState();
}

class _SheetLearnState extends State<SheetLearn> with ProductSheetMixin {
  Color _backgroundColor = Colors.white;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _backgroundColor,
      appBar: AppBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final result = await showCustomSheet(context, const Text('data'), 0.3);
          inspect(result);
          if (result is bool) {
            setState(() {
              _backgroundColor = Colors.yellowAccent;
            });
          }
        },
        child: const Icon(Icons.share),
      ),
      body: Center(
        child: TextButton(
            onPressed: () => showCustomSheet(context, const ImageLearn200(), 0.95), child: const Text('open')),
      ),
    );
  }
}

mixin ProductSheetMixin {
  Future<T?> showCustomSheet<T>(BuildContext context, Widget child, double heightRate) async {
    return await showModalBottomSheet<T>(
      backgroundColor: Colors.red,
      barrierColor: Colors.transparent,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(14.0))),
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return SizedBox(height: MediaQuery.of(context).size.height * heightRate, child: _CustomMainSheet(child: child));
      },
    );
  }
}

class _BaseSheetHeader extends StatelessWidget {
  const _BaseSheetHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const double _gridHeigth = 32;
    return SizedBox(
      height: _gridHeigth,
      child: Stack(
        alignment: Alignment.centerRight,
        children: [
          Divider(
            color: Colors.amber,
            thickness: 3,
            indent: MediaQuery.of(context).size.width * 0.35,
            endIndent: MediaQuery.of(context).size.width * 0.35,
          ),
          Positioned(
            child: IconButton(
              padding: EdgeInsets.zero,
              onPressed: () => Navigator.of(context).pop<bool>(true),
              icon: const Icon(Icons.close),
            ),
          ),
        ],
      ),
    );
  }
}

class _CustomMainSheet extends StatelessWidget {
  const _CustomMainSheet({
    Key? key,
    required this.child,
  }) : super(key: key);
  final Widget child;
  @override
  Widget build(BuildContext context) {
    Color _backgroundColor = Colors.transparent;
    const double _gridHeigth = 32;
    return SafeArea(
      child: Container(
        color: _backgroundColor,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [const _BaseSheetHeader(), Expanded(child: child)],
        ),
      ),
    );
  }
}
