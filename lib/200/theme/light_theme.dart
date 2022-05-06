import 'package:flutter/material.dart';

//* ThemeData theme = ThemeData.light().copyWith();
//? Üstteki kullanımda özel olarak Light theme'i özelleştirmeyi tercih ediyoruz
//? Eğer projenin tüm datasının manipüle etmek istersek Theme'i en baştan kodlamamız gerkir.

class LightTheme {
  final _lightColor = _LightColor();
  late final ThemeData theme;

  LightTheme() {
    theme = ThemeData(
      appBarTheme: const AppBarTheme(
          elevation: 0.1,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)))),
      scaffoldBackgroundColor: Colors.white.withOpacity(0.9),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(backgroundColor: Colors.green),
      buttonTheme:
          ButtonThemeData(colorScheme: ColorScheme.light(onPrimary: Colors.purple, onSecondary: _lightColor._blueMana)),
      checkboxTheme: CheckboxThemeData(fillColor: MaterialStateProperty.all(_lightColor._blueMana)),
      colorScheme: ColorScheme.light(
        onSecondary: _lightColor._lightRed,
        //onPrimary: _lightColor._blueMana,
      ),

      // appBarTheme: AppBarTheme(backgroundColor: Colors.amber),
      textTheme: ThemeData().textTheme.copyWith(
            subtitle1: const TextStyle(
              fontSize: 24.0,
            ),
          ),
    );
  }
}

class _LightColor {
  final Color _lightRed = const Color.fromARGB(255, 255, 15, 15);
  final Color _blueMana = const Color.fromARGB(214, 144, 181, 33);
}


//? kullandıgım theme custom bir theme. 
//? sayfa içindeki bir text'in style'ını theme'dan okudum ve subtitle1'e eşitledim 
//? Sonra custtom theme dan text them'i oldugu gibi kopyalayarak içindeki style porperty'sini 
//? özelleştirdim 


//! Sadece custom bir theme oluşturmak yetmez aynı zamanda elemanların style özelliklerini bu custom
//! themedan okuyarak belirtmemiz gereklidir. 