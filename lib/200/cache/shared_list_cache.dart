import 'package:flutter/material.dart';
import 'shared_learn_cache.dart';
import 'shared_manager.dart';
import 'user_model.dart';
import 'User Cache/user_cache_manager.dart';

class SharedListCache extends StatefulWidget {
  const SharedListCache({Key? key}) : super(key: key);

  @override
  State<SharedListCache> createState() => _SharedListCacheState();
}

class _SharedListCacheState extends LoadingStatefull<SharedListCache> {
  late final UserCacheManager _userCacheManeger;
  List<User> _users = [];

  @override
  void initState() {
    super.initState();
    _initialize();

    //? Shared Manager'i bu şekilde initialize edilmeden vermiş oluruz dolayısıyla hata alacağız
  }

  Future<void> _initialize() async {
    changeLoading();
    SharedManager _manager = SharedManager();
    await _manager.init();
    _userCacheManeger = UserCacheManager(manager: _manager);
    _users = _userCacheManeger.getItems(SharedKeys.users) ?? [];
    changeLoading();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: isLoading
            ? const CircularProgressIndicator(
                color: Colors.white,
              )
            : const SizedBox.shrink(),
        actions: isLoading
            ? null
            : [
                IconButton(
                    onPressed: (() async {
                      changeLoading();
                      await _userCacheManeger.saveItems(_users, SharedKeys.users);
                      changeLoading();
                    }),
                    icon: const Icon(
                      Icons.download_outlined,
                    )),
                IconButton(
                  onPressed: (() {
                    changeLoading();
                    _userCacheManeger.getItems(SharedKeys.users);
                    changeLoading();
                  }),
                  icon: const Icon(Icons.remove_circle_outline),
                )
              ],
      ),
      body: _userListView(userItem: _users),
    );
  }
}

class _userListView extends StatelessWidget {
  _userListView({
    Key? key,
    required this.userItem,
  }) : super(key: key);

  final List<User>? userItem;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: userItem?.length ?? 0,
      itemBuilder: (context, index) => Card(
        margin: const EdgeInsets.all(10), //? kanser kullanım
        child: ListTile(
          title: Text(userItem?[index].name ?? ''),
          subtitle: Text(userItem?[index].description ?? ''),
          trailing: Text(userItem?[index].url ?? '',
              style: context.textExtension().headline4?.copyWith(
                    decoration: TextDecoration.underline,
                    color: context.colorExtension().error,
                  )),
        ),
      ),
    );
  }
}
