import 'package:flutter/material.dart';

import '../components/home_components.dart';
import '../models/menu.dart';
import '../utils/contant.dart';

class FavoriteItem extends StatelessWidget {
  static const id = 'FavoriteScreen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Favorite"),),
      body: Container(
        child: FutureBuilder<Object>(
          future: getFavorite(),
          builder: (context, snapshot) {
            if(snapshot.hasData){
              List items = snapshot.data;
              return SingleChildScrollView(
                child: Wrap(
                children: items.map((e) => Dismissible(
                  onDismissed: (DismissDirection d)=>removeFavoite(items, e['id'].toString()),
                  key: Key(e['id'].toString()),
                  child: MenuItem(menu: Menu(e),fav: true,))).toList()
            ),
              );
            }else{
              return Center(
                child:CircularProgressIndicator(),
              );
            }
            
          }
        ),
      ),
    );
  }
}