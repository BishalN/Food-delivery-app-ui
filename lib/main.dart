import 'package:flutter/material.dart';

import './screens/home_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Food Delivery UI',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: Colors.deepOrangeAccent,
          scaffoldBackgroundColor: Colors.grey[50]),
      home: HomeScreen(),
    );
  }
}
