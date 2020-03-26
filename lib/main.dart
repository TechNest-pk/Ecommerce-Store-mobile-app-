import 'package:flutter/material.dart';

import './products_overview.dart';
import './product_detail_screen.dart';
import './home_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'E-commerce Store',
      theme: ThemeData(
        primaryColor: Colors.blue[900],
        accentColor: Colors.redAccent,
      ),
      home: HomeScreen(),
      routes: {
        ProductDetailScreen.routeName: (ctx) => ProductDetailScreen(),
        ProductsOverviewScreen.routeName: (ctx) => ProductsOverviewScreen(),
      }
    );
  }
}