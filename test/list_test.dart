import 'dart:developer';
import 'dart:math';
import 'package:collection/collection.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:master/300/generic_learn.dart';
import 'package:master/product/widget/card/high_card.dart';

void main() {
  setUp(() {});
  test('List best of', () {
    final users = [
      GenericUser('name1', '2', 1),
      GenericUser('name2', '2', 10),
      GenericUser('name3', '2', 20),
    ];

    //? users.add(GenericUser('name', 'id', 12));

    List<HighCard> highCards = users.map((e) => HighCard(item: e.name.split('').toList())).toList();
    //? maplemenin amacı elimdeki modelden yeni bir model olusturmaktır

    try {
      final response = users.singleWhere((element) => element.findUserName('name'),
          orElse: () => GenericUser('notFound', 'NotFound', -1));
      print(response.money);
    } catch (e) {
      print(e);
    }
    print(users.where((element) => element.money > 500));

    users.addAll([GenericUser('name', 'id', 15), GenericUser('name', 'id', 15), GenericUser('name', 'id', 15)]);
    users.take(5);
    users.removeWhere((element) => element.name == 'Hello World');

    users.remove(GenericUser('name1', '2', 1)); // Remove calısmaz cunku refereanceler isin icinde
    //? Equatable kullandıgımız icin artık remove'un icindeki elemanla listedeki eleman id bakımından aynı
    //? degerdelerse referance olarak farklı olmalarına ragmen equatable sayesinde silinirler.

    users.removeAt(3); //* remove the 3th element

    users.removeWhere((element) => element.id == 100); //? id degerei 100 olano bul ve sil demek

    users.indexOf(GenericUser('name1', '2', 1)); //? equality kullanılmıssa elemanlar uyusur ve aradıgımızın
    //? indexsini alabailiriz yoksa herhangi bir geri donut alamayız

    users.indexWhere((element) => element.id == 100); //? id si 100 olan elemanti baana dondur demektir.

    //* users.asMap();
    users.lastWhere((element) => element.id == 10);

    // users.map((e) => e.money).where((element) => element > 5);

    users.expand((element) => [GenericUser('name', 'id', 12)]);
  });

  test('List best of with collection', () {
    final users = [
      GenericUser('name1', '2', 10),
      GenericUser('name2', '2', 10),
      GenericUser('name3', '2', 20),
    ];

    //? users.add(GenericUser('name', 'id', 12));

    List<HighCard> highCards = users.map((e) => HighCard(item: e.name.split('').toList())).toList();
    //? maplemenin amacı elimdeki modelden yeni bir model olusturmaktır

    final response = users.singleWhereOrNull(((element) => element.findUserName('name')));
    final response2 = users.lastWhereOrNull((element) => element.id == 5);

    users.lastOrNull; //? eleman belki bos
    users.forEachIndexed((index, element) {
      //* hem elementi hem de elementin kacıncı sırada oldugunu bize donduren kili forEachIndexed'dir :)

      users.sample(3);

      var isFirstSame = users.first == GenericUser('name1', '2', 10);
      print('isFirstSame: $isFirstSame');

      users.contains(GenericUser('name', 'id', 12));
      //? equality yoksa yine elemanler farklı olacagı icin buradan true alamayız

      users.any((element) => element.money >= 10);
    });
  });
}

//??? End Pointten gelen json String list'i mi ne de maplayabilyoruz sonra factory methodlaro
//? havalı bir sekilde json'un istedigimiz kısmını alıp bize evirip cevirip model halinde verebiliyor.
