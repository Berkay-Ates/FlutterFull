import 'package:shared_preferences/shared_preferences.dart';

class UserSaveViewModel {
  bool getReadData(IStore iStore, String key) {
    final iStoreResPonse = iStore.getStringKey(key);
    return iStoreResPonse;
  }
}

abstract class IStore {
  bool getStringKey(String key);
}

class SharedPrefStore extends IStore {
  final SharedPreferences sharedPreferences;

  SharedPrefStore(this.sharedPreferences);

  @override
  bool getStringKey(String key) {
    final response = sharedPreferences.getString(key);
    if (response?.isNotEmpty ?? false) {
      return true;
    }
    return false;
  }
}


//? abstract class tanımla 
//? abstract içine fonksiyınları tanımla
//? abstract classtan tureyen bir class tanımla ve bu class ta abstract classsın gücünü kullan

//? yeni bir classta abstract classı parametre olarak iste 
//? yeni classı kullandıgımız yerde abstract classtan türeyen classı parametre olarak ver

