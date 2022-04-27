import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppbarLearn extends StatelessWidget {
  const AppbarLearn({Key? key}) : super(key: key);
  final String _title = 'Appbar Learn';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_title),
        leading: Icon(Icons.chevron_left),
        backgroundColor: Colors.transparent,
        elevation: 0,
        //* appbarı sayfa ile bütünleştirmek için rengini transparent yapıp elevation'unu sıfıra eşitleriz
        //? actionsIconTheme: IconThemeData(color: Colors.amber), tüm iconlara aynı rengi tek yerden verebiliriz
        centerTitle: true,
        systemOverlayStyle: SystemUiOverlayStyle.light,
        actions: [
          IconButton(
            onPressed: () => null,
            icon: Icon(Icons.accessibility_sharp),
          ),
          const Center(
            child: CircularProgressIndicator(
              color: Colors.white38,
            ),
          ),
        ],
      ),
    );
  }
}
