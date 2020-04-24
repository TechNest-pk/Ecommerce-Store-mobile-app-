import 'package:ecommerce_store/screens/auth_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './providers/auth.dart';
import './providers/products.dart';
import './providers/cart.dart';
import './screens/products_overview.dart';
import './screens/product_detail_screen.dart';
import './screens/home_screen.dart';
import './screens/categories_overview_screen.dart';
import './screens/cart_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: Auth(),
        ),
        ChangeNotifierProvider.value(
          value: Products(),
        ),
        ChangeNotifierProvider.value(
          value: Cart(),
        ),
      ],
      child: Consumer<Auth>(
        builder: (ctx, auth, _) => MaterialApp(
          title: 'E-commerce Store',
          theme: ThemeData(
            primaryColor: Color(0xFF087059),
            accentColor: Color(0xFF4B5652),
          ),
          home: HomeScreen(),
          // auth.isAuth
          //         ? HomeScreen()
          //         : AuthScreen(),
          routes: {
            HomeScreen.routeName: (ctx) => HomeScreen(),
            AuthScreen.routeName: (ctx) =>AuthScreen(),
            ProductDetailScreen.routeName: (ctx) => ProductDetailScreen(),
            ProductsOverviewScreen.routeName: (ctx) => ProductsOverviewScreen(),
            CategoriesOverviewScreen.routeName: (ctx) =>
                CategoriesOverviewScreen(),
            CartScreen.routeName: (ctx) => CartScreen(),
          }),
      ),
    );
  }
}
