import 'package:flutter/material.dart';

//* Core Component yapmakla widget parçalamak farklı şeylerfir core component daha jenerik olmalıdır

class CustomComponentLearn extends StatelessWidget {
  const CustomComponentLearn({Key? key}) : super(key: key);
  final _title = 'Custom Component';
  final _title2 = 'Food';
  final _food = 'Food2';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_title),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: CustomFoodWidget(
                    title: _food,
                    onPressed: () {},
                  )),
            ),
          ),
          CustomFoodWidget(title: _title2, onPressed: () {})
        ],
      ),
    );
  }
}

class CustomFoodWidget extends StatelessWidget
    with _ColorsUtility, _PaddingUtility {
  CustomFoodWidget({required this.title, required this.onPressed, Key? key})
      : super(key: key);
  final String title;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        shape: const StadiumBorder(),
        primary: redColor,
      ),
      child: Padding(
        padding: normalPadding,
        child: Text(
          title,
          style: Theme.of(context)
              .textTheme
              .headline6
              ?.copyWith(color: whiteColor, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

class _ColorsUtility {
  final Color redColor = Colors.red;
  final Color whiteColor = Colors.white;
  //? Extract widget yaptıgımızda bu classın özelliklerini kullanan elemanlar bu özellikleri parametre
  //? olarak alırlar bunun olmaması için elle yeni stateless widget oluşturup, bu yeni stateless widgeti
  //? colorsUtility sınfına extends ettirmemiz gerekir
}

class _PaddingUtility {
  final EdgeInsets normalPadding = const EdgeInsets.all(8.0);
}
