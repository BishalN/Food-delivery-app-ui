import 'package:flutter/material.dart';
import 'package:food_delivery_app/models/food.dart';
import 'package:food_delivery_app/models/restaurant.dart';
import 'package:food_delivery_app/widgets/rating_stars.dart';

class RestaurantScreen extends StatefulWidget {
  final Restaurant restaurant;
  RestaurantScreen({this.restaurant});
  @override
  _RestaurantScreenState createState() => _RestaurantScreenState();
}

class _RestaurantScreenState extends State<RestaurantScreen> {
  _buildMenuItem(Food menutItem) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image(
              image: AssetImage(menutItem.imageUrl),
              fit: BoxFit.cover,
              height: 100,
              width: 150,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Container(
            height: 100,
            width: 150,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                gradient: LinearGradient(colors: [
                  Colors.black.withOpacity(0.3),
                  Colors.black87.withOpacity(0.3),
                  Colors.black54.withOpacity(0.3),
                  Colors.black38.withOpacity(0.3)
                ], stops: [
                  0.1,
                  0.4,
                  0.6,
                  0.9
                ], begin: Alignment.topRight, end: Alignment.bottomLeft)),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Container(
            height: 100,
            width: 150,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  menutItem.name,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
                Text(
                  '\$' + menutItem.price.toString(),
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 15),
                )
              ],
            ),
          ),
        ),
        Positioned(
          left: 110,
          top: 55,
          child: Container(
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(30),
            ),
            child: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.add,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Hero(
                tag: widget.restaurant.imageUrl,
                child: Image(
                  height: 220,
                  image: AssetImage(widget.restaurant.imageUrl),
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 50, horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        icon: Icon(
                          Icons.arrow_back_ios,
                          size: 30,
                          color: Colors.white,
                        ),
                        onPressed: () => Navigator.of(context).pop()),
                    IconButton(
                        icon: Icon(
                          Icons.favorite,
                          size: 35,
                          color: Theme.of(context).primaryColor,
                        ),
                        onPressed: () => () {})
                  ],
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.restaurant.name,
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '0.2 miles away',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w300),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                RatingStars(widget.restaurant.rating),
                Text(widget.restaurant.address),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      FlatButton(
                        onPressed: () {},
                        child: Text(
                          'Reviews',
                          style: TextStyle(color: Colors.white),
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        color: Theme.of(context).primaryColor,
                      ),
                      FlatButton(
                        onPressed: () {},
                        child: Text(
                          'Contact',
                          style: TextStyle(color: Colors.white),
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        color: Theme.of(context).primaryColor,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Center(
            child: Text(
              'Menu',
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 15,
                  letterSpacing: 1.2),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              children: List.generate(
                widget.restaurant.menu.length,
                (index) {
                  Food food = widget.restaurant.menu[index];
                  return _buildMenuItem(food);
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
