import 'package:shared_preferences/shared_preferences.dart';

SharedPreferences sharedPreferences;

class SHMethods {
  static initSharedPreferences() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static void setFavById(String idMenu, String idRest, bool isFav) {
    if (!isFav) {
      sharedPreferences.setString(idMenu, idRest);
    } else {
      sharedPreferences.remove(idMenu);
    }
  }

  static List<Map> getFavs() {
    List keys = sharedPreferences.getKeys().toList();
    List<Map> favs = [];
    keys.forEach((key) {
      favs.add({
        'idMenu': key,
        'idRest': sharedPreferences.getString(key),
      });
    });
    return favs;
  }
}
