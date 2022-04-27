import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:master/100/image_learn.dart';

class NoteDemosView extends StatelessWidget {
  const NoteDemosView({Key? key}) : super(key: key);
  final _title = 'Creat your first note';
  final _description = 'This is the course that will teach me how to code efficiently';
  final _title2 = 'Create a note';
  final _importNotes = 'Import Notes';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[50],
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: PadddingItems.horizontalPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            PngImage(name: ImageItems().applewithbook2WithouthPath),
            Padding(
              padding: PadddingItems.titlePadding,
              child: TitleWidget(title: _title),
            ),
            Padding(
              padding: PadddingItems.titlePadding,
              child: DescriptionWidget(description: _description * 10),
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: (() => null),
              style: ElevatedButton.styleFrom(),
              child: SizedBox(
                height: ButtonHeights.createButtonHeight,
                child: Center(
                  child: TitleWidget(
                    title: _title2,
                  ),
                ),
              ),
            ),
            TextButton(
              onPressed: (() => null),
              child: Text(
                _importNotes,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}

class DescriptionWidget extends StatelessWidget {
  const DescriptionWidget({
    Key? key,
    required String description,
  })  : _description = description,
        super(key: key);

  final String _description;

  @override
  Widget build(BuildContext context) {
    return Text(
      _description,
      style: Theme.of(context)
          .textTheme
          .subtitle1
          ?.copyWith(color: Theme.of(context).colorScheme.onSecondary, fontWeight: FontWeight.w300),
    );
  }
}

class TitleWidget extends StatelessWidget {
  const TitleWidget({
    Key? key,
    required String title,
  })  : _title = title,
        super(key: key);

  final String _title;

  @override
  Widget build(BuildContext context) {
    return Text(
      _title,
      textAlign: TextAlign.center,
      style: Theme.of(context)
          .textTheme
          .headline5
          ?.copyWith(color: Theme.of(context).colorScheme.onSecondary, fontWeight: FontWeight.w600),
    );
  }
}

class PadddingItems {
  static final EdgeInsets horizontalPadding = EdgeInsets.symmetric(horizontal: 40);

  static final titlePadding = const EdgeInsets.only(top: 15);
}

class ButtonHeights {
  static const double createButtonHeight = 50;
}
