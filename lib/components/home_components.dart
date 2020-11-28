import 'package:flutter/material.dart';
import 'package:restaurant_app/api/sh_methods.dart';
import 'package:restaurant_app/models/menu.dart';
import 'package:restaurant_app/models/restaurant.dart';
import 'package:restaurant_app/screens/order_screen.dart';
import 'package:restaurant_app/utils/contant.dart';
import 'package:restaurant_app/utils/size.dart';

class RateStars extends StatelessWidget {
  double rating;

  List<Widget> rateWidgets = [];
  RateStars({this.rating});
  @override
  Widget build(BuildContext context) {
    try {
      rating = rating / 2;
    } catch (e) {
      rating = 0;
    }
    for (int i = 1; i <= 5; i++) {
      IconData icon = Icons.star;
      if (rating != null) {
        if (rating < i) {
          if (rating < (i - 0.5)) {
            icon = Icons.star_border_outlined;
          } else {
            icon = Icons.star_half;
          }
        }
      } else {
        icon = Icons.star_border_outlined;
      }

      rateWidgets.add(Icon(
        icon,
        color: Color(0xffFFA303),
      ));
    }

    return Row(
      children: rateWidgets,
    );
  }
}

class RestaurantItem extends StatelessWidget {
  final Restaurant restaurant;
  RestaurantItem({this.restaurant});
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: height * 0.35,
          margin: EdgeInsets.symmetric(
            vertical: height * 0.01,
          ),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: restaurant.image,
              fit: BoxFit.cover,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black45,
                offset: Offset(4, 6),
                blurRadius: 10,
              ),
            ],
            borderRadius: BorderRadius.circular(30),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                height: height * 0.18,
                width: double.infinity,
                padding: EdgeInsets.symmetric(
                  vertical: height * 0.03,
                  horizontal: width * 0.05,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.black54,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      restaurant.name.toUpperCase(),
                      style: bTitleStyle,
                    ),
                    Text(
                      restaurant.city.toUpperCase(),
                      style: bDescStyle,
                    ),
                    RateStars(
                      rating: restaurant.rating.toDouble(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class MenuItem extends StatefulWidget {
  final Menu menu;
  Restaurant restaurant;
  Function ref;
  MenuItem({this.menu, this.ref, this.restaurant});

  @override
  _MenuItemState createState() => _MenuItemState();
}

class _MenuItemState extends State<MenuItem> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    isChecked = false;
    for (int i = 0; i < orders.length; i++) {
      if (orders[i]['menu'].id == widget.menu.id) {
        isChecked = true;
      }
    }

    return Container(
      height: height * 0.35,
      margin: EdgeInsets.symmetric(
        vertical: height * 0.01,
        horizontal: width * 0.03,
      ),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: widget.menu.image,
          fit: BoxFit.cover,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black45,
            offset: Offset(4, 6),
            blurRadius: 10,
          ),
        ],
        borderRadius: BorderRadius.circular(30),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            height: height * 0.22,
            width: double.infinity,
            padding: EdgeInsets.symmetric(
              vertical: height * 0.03,
              horizontal: width * 0.05,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Colors.black54,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.menu.name.toUpperCase(),
                  style: bTitleStyle,
                ),
                Text(
                  widget.menu.descr,
                  style: bDescStyle,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RateStars(
                      rating: widget.menu.rating,
                    ),
                    Theme(
                      data: ThemeData.dark(),
                      child: Checkbox(
                          value: isChecked,
                          onChanged: (value) {
                            if (value) {
                              orders.add({
                                'menu': widget.menu,
                                'rest': widget.restaurant,
                              });
                            } else {
                              var menu;
                              orders.forEach((element) {
                                print(element);
                                if (widget.menu.id == element['menu'].id) {
                                  menu = element;
                                }
                              });
                              orders.remove(menu);
                            }
                            print(orders.length);
                            setState(() {
                              isChecked = value;
                            });
                            try {
                              widget.ref();
                            } catch (e) {}
                          }),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
