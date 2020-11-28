import 'package:flutter/cupertino.dart';
import 'package:restaurant_app/api/api_methods.dart';

class Restaurant {
  Restaurant(Map<String, dynamic> json) {
    fromJson(json);
  }

  int id;
  String name;
  String city;
  String lat;
  String lng;
  String phone;
  NetworkImage image;
  int rating;

  void fromJson(Map<String, dynamic> json) {
    this.id = json["id"];
    this.name = json["name"];
    this.city = json["city"];
    this.lat = json["lat"];
    this.lng = json["lng"];
    this.phone = json["phone"];
    this.image = NetworkImage(api + '/static/' + json["image"]);
    this.rating = json["rating"];
  }
}
