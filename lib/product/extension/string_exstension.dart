extension ColorExtension on String? {
  int get getColorCode {
    var _newColor = this?.replaceFirst('#', '0xff') ?? '';
    return int.tryParse(_newColor) ?? 0;
  }
}



//*** Extension yazarken oncelikle Direkmen extension bir class olusturup ivinde istedigimiz fonksiyonu
//* tanımlıyoruz.  Sonra tanımladıgımız bu fnksiyon otomatik olarak uzerine tanımını yaptıgımız bu 
//* exstension un hitap ettigi tum objelerde direk geliyor. Stringlerde .split gibi 
//* int gibi veya int'lerde to 


//?  Yazdıgımız exstension'un nullable objelerde de calısabılmesi icin Yukarıdaki Gibi Stringin sonuna
//? Soru isareti koymamız gerekir. 