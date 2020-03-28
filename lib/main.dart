import 'package:flutter/material.dart';

import './screens/products_overview.dart';
import './screens/product_detail_screen.dart';
import './screens/home_screen.dart';
import './screens/categories_overview_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'E-commerce Store',
      theme: ThemeData(
        primaryColor: Color(0xFFEC407A),
        accentColor: Colors.redAccent,
      ),
      home: HomeScreen(),
      routes: {
        ProductDetailScreen.routeName: (ctx) => ProductDetailScreen(),
        ProductsOverviewScreen.routeName: (ctx) => ProductsOverviewScreen(),
        CategoriesOverviewScreen.routeName: (ctx) => CategoriesOverviewScreen(),
      }
    );
  }
}