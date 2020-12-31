import 'package:flutter/material.dart';
import 'package:food_delivery_app/models/restaurant.dart';
import 'package:food_delivery_app/screens/cart_screen.dart';
import 'package:food_delivery_app/widgets/rating_stars.dart';
import 'package:food_delivery_app/widgets/recent_orders.dart';

import '../data/data.dart';
import './restaurant_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  _buildRestaurants() {
    List<Widget> _restaurantList = [];
    restaurants.forEach((Restaurant restaurant) {
      _restaurantList.add(
        GestureDetector(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => RestaurantScreen(restaurant: restaurant),
            ),
          ),
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              border: Border.all(width: 1, color: Colors.grey[200]),
            ),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Hero(
                    tag: restaurant.imageUrl,
                    child: Image(
                      height: 150,
                      width: 100,
                      image: AssetImage(restaurant.imageUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Flexible(
                  child: Container(
                    margin: EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          restaurant.name,
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        RatingStars(restaurant.rating),
                        SizedBox(
                          height: 4,
                        ),
                        Text(
                          restaurant.address,
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w600),
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Text(
                          '0.2 miles away',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w600),
                          overflow: TextOverflow.ellipsis,
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      );
    });
    return Column(
      children: _restaurantList,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.account_circle,
            size: 30,
          ),
          onPressed: () {},
        ),
        title: Text(
          'Food Delivery',
          style: TextStyle(fontSize: 17),
        ),
        actions: [
          FlatButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => CartScreen(),
                  ),
                );
              },
              child: Text(
                'Cart (${currentUser.orders.length})',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ))
        ],
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextField(
                decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(vertical: 15),
              fillColor: Colors.white,
              filled: true,
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(width: 0.8)),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide(
                    width: 0.8, color: Theme.of(context).primaryColor),
              ),
              hintText: 'Search Food or Restaurants',
              prefixIcon: Icon(
                Icons.search,
                size: 30,
              ),
              suffixIcon: IconButton(icon: Icon(Icons.clear), onPressed: () {}),
            )),
          ),
          RecentOrders(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  'Nearby Restaurants',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1.2),
                ),
              ),
              _buildRestaurants()
            ],
          )
        ],
      ),
    );
  }
}
