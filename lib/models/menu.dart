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
  String imagelink;
  int price;
  String image;
  dynamic rating;

  void fromJson(Map<String, dynamic> json) {
    this.id = json["id"];
    this.restId = json["rest_id"];
    this.name = json["name"];
    this.descr = json["descr"];
    this.price = json["price"];
    this.image = !json["image"].contains("http")? api + '/static/' + json["image"]:json["image"];
    this.rating = json["rating"];
  }

  Map toJson() {
    Map json = {};
    json["id"] = this.id;
    json["rest_id"] = this.restId;
    json["name"] = this.name;
    json["descr"] = this.descr;
    json["price"] = this.price;
    json["image"] = this.image;
    json["rating"] = this.rating;
    return json;
  }
}
