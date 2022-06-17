import 'dart:convert';

import '../shared_manager.dart';
import '../user_model.dart';

class UserCacheManager {
  SharedManager manager;
  UserCacheManager({
    required this.manager,
  });

  Future<void> saveItems(List<User> userList, SharedKeys keys) async {
    final _userList = userList.map((e) => jsonEncode(e.toJson())).toList();
    await manager.saveStringItems(_userList, keys);
  }

  List<User>? getItems(SharedKeys keys) {
    final itemsSring = manager.getStrings(keys);
    if (itemsSring?.isNotEmpty ?? false) {
      return itemsSring!.map((e) {
        final json = jsonDecode(e);
        if (json is Map<String, dynamic>) {
          return User.fromJson(json);
        }
        return User(name: '', description: '', url: '');
      }).toList();
    }
    return null;
  }
}
