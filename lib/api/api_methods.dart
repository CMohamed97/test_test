import 'package:dio/dio.dart';
import 'package:restaurant_app/models/menu.dart';
import 'package:restaurant_app/models/restaurant.dart';

const api = 'http://appback.ppu.edu';
Dio dio = Dio();

class APIMethods {
  static Future<List<Menu>> getMenus(String id) async {
    String apiUrl = '$api/menus/' + id;

    Response response = await dio.get(apiUrl);
    print(response.data);
    List<Menu> menus = [];
    response.data.forEach((menu) {
      menus.add(Menu(menu));
    });
    return menus;
  }

  static Future<List<Restaurant>> getAllRestaurants({String id}) async {
    String apiUrl = '$api/restaurants/';

    if (id != null) {
      apiUrl = apiUrl + id + '/';
    }

    Response response = await dio.get(apiUrl);

    List<Restaurant> restaurants = [];
    response.data.forEach((restaurant) {
      restaurants.add(Restaurant(restaurant));
    });

    return restaurants;
  }
}
