import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

const TextStyle bTitleStyle = TextStyle(
  color: Colors.white,
);
const TextStyle bDescStyle = TextStyle(
  color: Color(0xffDBDBDB),
);

Future getFavorite() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String favorite = await prefs.get('favorites');
  if(favorite!=null){
      List itms = json.decode(favorite);
      return itms;
  }else{
    return <Map>[];
  }
  
}

setFavorite(String favorites) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString('favorites', favorites);
}




void removeFavoite(List favorites, String idDelItem) async {
  //List data = json.decode(favorites);
  favorites.removeWhere((element) => element['id'].toString()==idDelItem);
  setFavorite(json.encode(favorites));
}
