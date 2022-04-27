import 'package:flutter/material.dart';
import 'package:master/100/icon.learn.dart';
import 'package:master/100/image_learn.dart';
import 'package:master/100/navigate_detail_learn.dart';

class NavigationLearn extends StatefulWidget {
  const NavigationLearn({Key? key}) : super(key: key);

  @override
  State<NavigationLearn> createState() => _NavigationLearnState();
}

class _NavigationLearnState extends State<NavigationLearn> with NavigatorManager {
  List<int> selectedItems = [];
  void addSelected(int index) {
    setState(() {
      selectedItems.add(index);
    });
  }

  void removeSelected(int index) {
    setState(() {
      selectedItems.remove(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Navigation Learn'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: ListView.builder(
          itemBuilder: ((context, index) {
            return TextButton(
              onPressed: () async {
                final response = await navigateToWidget_Normal_WithData<bool>(
                    context,
                    NavigateDetailLearn(
                      isOkey: (selectedItems.contains(index)),
                    ));
                if (response == true) {
                  addSelected(index);
                } else {
                  removeSelected(index);
                }
              },
              child: Placeholder(
                color: selectedItems.contains(index) ? Colors.green : Colors.red,
              ),
            );
          }),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.chevron_right),
        onPressed: () async {
          // async olarak push ediyorum sonra buradan bana bir bool deönecek haberin olsun
          //diye belirtiyorum
          //* final response = await navigateToWidget_Normal_WithData<bool>(context, NavigateDetailLearn());
          //? floating action buttondan gidersek kullanıcının hangi place holder'ı seçip gittigini
          //? tabiki anlayamayız
        },
      ),
    );
  }
}

mixin NavigatorManager {
  void navigateToWidget(BuildContext context, Widget target) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: ((context) => target),
        fullscreenDialog: true,
        settings: const RouteSettings(),
      ),
    );
  }

  Future<T?> navigateToWidget_Normal_WithData<T>(BuildContext context, Widget target) {
    return Navigator.push<T>(
      context,
      MaterialPageRoute(
        builder: ((context) => target),
        fullscreenDialog: true,
        settings: const RouteSettings(),
      ),
    );
  }
}
