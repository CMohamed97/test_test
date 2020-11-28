import 'package:flutter/material.dart';
import 'package:restaurant_app/api/api_methods.dart';

class Menu {
  Menu(Map<String, dynamic> json) {
    fromJson(json);
  }

  int id;
  int restId;
  String name;
  String descr;
  int price;
  NetworkImage image;
  dynamic rating;

  void fromJson(Map<String, dynamic> json) {
    this.id = json["id"];
    this.restId = json["rest_id"];
    this.name = json["name"];
    this.descr = json["descr"];
    this.price = json["price"];
    this.image = NetworkImage(api + '/static/' + json["image"]);
    this.rating = json["rating"];
  }
}
