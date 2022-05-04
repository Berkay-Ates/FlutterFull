import 'package:dio/dio.dart';

class PostModel1 {
  int? userId;
  int? id;
  String? title;
  String? body;
}

class PostModel2 {
  int userId;
  int id;
  String title;
  String body;

  PostModel2(this.userId, this.id, this.title, this.body);
  //? elemanların başında final yazmadıgı için gelen constructor da required gerekmiyor.
}

class PostModel3 {
  final int userId;
  final int id;
  final String title;
  final String body;

  PostModel3(this.userId, this.id, this.title, this.body);
  //? bu senoryada elemanlar sadece constructor oluştururken gelebilir onun haricinde gelemez.
}

class PostModel4 {
  final int userId;
  final int id;
  final String title;
  final String body;

  PostModel4({required this.userId, required this.id, required this.title, required this.body});
}

class PostModel5 {
//? Bu constructor yapısında elemanlar tamamen Private olur. Constructor içinde Modelin
//? variablelarına denk gelecek elamanları alırız sonra bu elemanları private şekildeki
//? elemanlara eşitiyoruz. Bu sayede Model5' in herhangi bir objesinden bir metod dahi gözükmüyor

  final int _userId;
  final int _id;
  final String _title;
  final String _body;

  int get userId => _userId;
  PostModel5({
    required int userId,
    required int id,
    required String title,
    required String body,
  })  : _userId = userId,
        _id = id,
        _title = title,
        _body = body;
}

class PostModel6 {
  late final int _userId;
  late final int _id;
  late final String _title;
  late final String _body;

  PostModel6({
    required int userId,
    required int id,
    required String title,
    required String body,
  }) {
    _userId = userId;
    _id = id;
    _title = title;
    _body = body;
  }
}

class PostModel7 {
//? elemanları private tutup required olmalarını istemessek bu defa gerekli olan işlem
//? variable'lara default değerler atamak oluyor

  late final int _userId;
  late final int _id;
  late final String _title;
  late final String _body;

  PostModel7({
    int userId = 0,
    int id = 0,
    String title = '',
    String body = '',
  }) {
    _userId = userId;
    _id = id;
    _title = title;
    _body = body;
  }
}

var a = PostModel7();

class PostModel8 {
//* herhangi bir service den beslenecek olan model için en uygun olan class yapısı

  final int? userId;
  final int? id;
  final String? title;
  String? body; //? to update with func we removed final

  PostModel8({this.userId, this.id, this.title, this.body});
  //! default value vermek demek eğer kullanıcı boş bırakırsa bu değeri ata

//* final ise fonksiyon da sökmez copywith ile yapmak gerekli
  void updateBody(String data) {
    if (data != null && data.isNotEmpty) {
      body = data;
    }
  }

  PostModel8 copyWith({
    int? userId,
    int? id,
    String? title,
    String? body,
  }) {
    return PostModel8(
      userId: userId ?? this.userId,
      id: id ?? this.id,
      title: title ?? this.title,
      body: body ?? this.body,
    );
  }
}

//? var postmodelWithoutCurlyBraces = PostModel8(22, 12, 'title', 'body');
//* var postmodelWithCurlyBraces = PostModel8(userId: 1, id: 3, title: '', body: '');
// optional odugu için named parametreler ilk başta belirmez.

class PostModel4Mine {
  int? userId;
  final int id;
  final String title;
  final String body;

  PostModel4Mine({this.userId = 889, required this.id, required this.title, required this.body});
  //? bu senoryada elemanlar sadece constructor oluştururken gelebilir onun haricinde dokunulamazlar.
  //? ayrıca constructorda named olarak girilirler.
}

//! var postmodel4 = PostModel4(id: 11, title: '', body: ''); final bir alana defult değer verirsem
//! constructor da bu değeri istemez

var postmodel4 = PostModel4Mine(userId: 44, id: 3, title: 'fdfd ', body: '');
// var postModel41 = PostModel4(id: id, title: title, body: body)
//* default değer vereceksem bu değeri süslü parantez içinde vermem gerek ve
//* default degeri olacak olan elemanları final yaparsam bu elemanlar constructor içinde
//* userdan istenmez çünkü final ve default olarak bir değere sahip.

//? required parametreler default value ye sahip olamazlar.

class PostModelE1 {
  late final int _userId;
  late final int _id;
  late final String _title;
  late final String _body;

  PostModelE1({
    required int userId,
    required int id,
    required String title,
    required String body,
  }) {
    _userId = userId;
    _id = id;
    _title = title;
    _body = body;
  }
}

class PostModelE2 {
  //? private elemanlı bir classın constructorundan sonra private elemanların
  //? değerlerini alırken ya noktalı virgül yada süslü parantez kullanabiliriz.
  //? Süslü parantez kullanırsak elemanlar late ile işaretlenmeliler

  late final int _userId;
  late final int _id;
  late final String _title;
  late final String _body;

  PostModelE2({
    required int userId,
    required int id,
    required String title,
    required String body,
  })  : _userId = userId,
        _id = id,
        _title = title,
        _body = body;
}

class DioImplement {
  final Dio _anVariable;

  DioImplement() : _anVariable = Dio(BaseOptions(baseUrl: 'https://google.com'));
}
