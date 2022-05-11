import 'package:master/200/cache/shared_preferences_notinit.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum SharedKeys { counter, users }

class SharedManager {
  SharedPreferences? preferences;

  SharedManager();

  void checkPreferences() {
    if (preferences == null) {
      throw SharedNotInitializeException().toString();
    }
  }

  Future<void> init() async {
    await Future.delayed(const Duration(seconds: 2));
    preferences = await SharedPreferences.getInstance();
  }

  Future<void> saveString(String value, SharedKeys key) async {
    checkPreferences();
    await preferences?.setString(key.name, value);
  }

  Future<void> saveStringItems(List<String> value, SharedKeys key) async {
    checkPreferences();
    await preferences?.setStringList(key.name, value);
  }

  String? getString(SharedKeys key) {
    checkPreferences();
    return preferences?.getString(key.name);
  }

  List<String>? getStrings(SharedKeys key) {
    checkPreferences();
    return preferences?.getStringList(key.name);
  }

  Future<bool> removeItem(SharedKeys key) async {
    checkPreferences();
    return await (preferences?.remove(key.name)) ?? false;
  }
}
