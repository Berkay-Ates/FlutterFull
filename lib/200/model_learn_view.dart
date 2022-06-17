import 'package:flutter/material.dart';

import 'model_learn.dart';

class ModelLearnView extends StatefulWidget {
  ModelLearnView({Key? key}) : super(key: key);

  @override
  State<ModelLearnView> createState() => _ModelLearnViewState();
}

class _ModelLearnViewState extends State<ModelLearnView> {
  var user9 = PostModel8(body: 'aaa');

  @override
  void initState() {
    super.initState();
    final user1 = PostModel1()
      ..body = 'kjfdk'
      ..id = 33
      ..title = '2 noktali kullanim sekli ';
    user1.body = 'a';

    final user2 = PostModel2(1, 2, 'f', 'f');
    user2.body = 'updated';

    final user3 = PostModel3(2, 1, 'f', 'v');

    //! user3.body = 'final variables could not be updated like this';
    //? değiştirememnin sebebi user3'un final olması değil PostModel3'ün variable larının final olması
    //? model3 kökten yeni bir değere eşitlenebilir ama içindeki değerler bu yüzden değiştirilemez

    final user4 = PostModel4(userId: 1, id: 3, title: '', body: '');
    //! user4.body = 'this is also final which means not alterable';

    final user5 = PostModel5(userId: 1, id: 3, title: 'lfl', body: 'lskdlf');
    //!* user5.nothing to see because of the class's private constructor
    //* ama eger private class içinde kendi encapsulationumuzu yazarsak bu verilere erişebiliriz.
    var userPrivateId = user5.userId;

    final user6 = PostModel6(userId: 1, id: 3, title: 'title', body: 'body');

    final user7 = PostModel7();
    //? postmodel7 required değerler istemediği için bize sorun çıkarmıyor

    final user8 = PostModel8(id: 33);

    //? final user19 = PostModel8(body: '8594');
    //? print(user19.body);
    //? give a default value to body and try this.
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(user9.body ?? '')),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            //! data kaybı
            //! user9 = PostModel8(title: 'updated');
            user9 = user9.copyWith(title: 'changed without any data changee just updated relevant area');
            user9.updateBody('update body by functions ');
          });
        },
      ),
    );
  }
}
