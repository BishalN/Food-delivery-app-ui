import 'package:flutter/material.dart';
import 'package:food_delivery_app/data/data.dart';
import 'package:food_delivery_app/models/order.dart';

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  _buildOrderItem(Order order) {
    return Container(
      height: 170,
      padding: EdgeInsets.all(20),
      child: Row(children: [
        Container(
          width: 120,
          decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(order.food.imageUrl),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(20)),
        ),
        Flexible(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 9),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  order.food.name,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  order.restaurant.name,
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: 100,
                  decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Colors.grey),
                      borderRadius: BorderRadius.circular(20)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 3),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {},
                          child: Text(
                            '+',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                color: Theme.of(context).primaryColor),
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          order.quantity.toString(),
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Text(
                            '-',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                color: Theme.of(context).primaryColor),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        Text(
          '\$' + (order.food.price * order.quantity).toString(),
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        )
      ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    double totalPrice = 0;
    currentUser.cart.forEach((Order order) => totalPrice += order.food.price);
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart (${currentUser.orders.length})'),
      ),
      body: ListView.separated(
        itemCount: currentUser.orders.length + 1,
        itemBuilder: (BuildContext context, int index) {
          if (index < currentUser.cart.length) {
            Order order = currentUser.cart[index];
            return _buildOrderItem(order);
          }
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Estimated deliver time',
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    Text(
                      '25 minutes',
                      style: TextStyle(fontWeight: FontWeight.w500),
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Total Cost',
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    Text(
                      '\$' + totalPrice.toStringAsFixed(2),
                      style: TextStyle(
                          fontWeight: FontWeight.w500, color: Colors.green),
                    ),
                  ],
                ),
                SizedBox(height: 100),
              ],
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return Divider(
            color: Colors.grey,
          );
        },
      ),
      bottomSheet: Container(
        height: 100,
        width: MediaQuery.of(context).size.width,
        decoration:
            BoxDecoration(color: Theme.of(context).primaryColor, boxShadow: [
          BoxShadow(color: Colors.black26, offset: Offset(0, -1), blurRadius: 6)
        ]),
        child: Center(
          child: FlatButton(
            onPressed: () {},
            child: Text(
              'CHECKOUT',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  letterSpacing: 2,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}
