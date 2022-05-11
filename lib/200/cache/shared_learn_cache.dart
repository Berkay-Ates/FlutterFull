import 'package:flutter/material.dart';
import 'package:master/200/cache/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:master/200/cache/shared_manager.dart';

class SharedLearn extends StatefulWidget {
  const SharedLearn({Key? key}) : super(key: key);

  @override
  State<SharedLearn> createState() => _SharedLearnState();
}

class _SharedLearnState extends LoadingStatefull<SharedLearn> {
  // late final List<User> userItem;
  late final SharedManager _manager;
  late final SharedPreferences prefs;

  int _currentValue = 0;

  void _onChanged(String? value) {
    int? _value = int.tryParse(value ?? '0');
    if (_value != null) {
      setState(() {
        _currentValue = _value;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _manager = SharedManager();
    initialize();
  }

  void initialize() async {
    changeLoading();
    await _manager.init();
    changeLoading();
    getDefaultValues();
  }

  void getDefaultValues() async {
    _onChanged(_manager.getString(SharedKeys.counter) ?? '');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _currentValue.toString(),
        ),
        actions: [
          isLoading
              ? CircularProgressIndicator(
                  color: context.colorExtension().onSecondary,
                )
              : const SizedBox.shrink()
        ],
        centerTitle: true,
      ),
      floatingActionButton: Row(
        mainAxisSize: MainAxisSize.min,
        children: [_saveDataButton(), _removeDataButton()],
      ),
      body: Column(
        children: [
          TextField(
            onChanged: ((value) => _onChanged(value)),
          ),
          Expanded(child: _userListView())
        ],
      ),
    );
  }

  Widget _saveDataButton() {
    return FloatingActionButton(
      onPressed: () async {
        changeLoading();
        await _manager.saveString(_currentValue.toString(), SharedKeys.counter);
        changeLoading();
      },
      child: const Icon(Icons.save_alt_outlined),
    );
  }

  Widget _removeDataButton() {
    return FloatingActionButton(
        onPressed: () async {
          changeLoading();
          await _manager.removeItem(SharedKeys.counter);
          _onChanged(_manager.getString(SharedKeys.counter));
          changeLoading();
        },
        child: const Icon(Icons.remove_circle_outline));
  }
}

class _userListView extends StatelessWidget {
  _userListView({
    Key? key,
  }) : super(key: key);

  final List<User> userItem = UserItems().users;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: userItem.length,
      itemBuilder: (context, index) => Card(
        margin: const EdgeInsets.all(10), //? kanser kullanım
        child: ListTile(
          title: Text(userItem[index].name ?? ''),
          subtitle: Text(userItem[index].description ?? ''),
          trailing: Text(userItem[index].url ?? '',
              style: context.textExtension().headline4?.copyWith(
                    decoration: TextDecoration.underline,
                    color: context.colorExtension().error,
                  )),
        ),
      ),
    );
  }
}

class UserItems {
  late final List<User> users;
  UserItems() {
    users = [
      User(name: 'name', description: 'description', url: 'url'),
      User(name: 'name2', description: 'description2', url: 'url2'),
      User(name: 'name3', description: 'description3', url: 'url3'),
      User(name: 'name4', description: 'description4', url: 'url4'),
    ];
  }
}

abstract class LoadingStatefull<T extends StatefulWidget> extends State<T> {
  bool isLoading = false;
  void changeLoading() {
    setState(() {
      isLoading = !isLoading;
    });
  }
}

extension ContextExtension on BuildContext {
  ColorScheme colorExtension() {
    return Theme.of(this).colorScheme;
  }

  TextTheme textExtension() {
    return Theme.of(this).textTheme;
  }
}
