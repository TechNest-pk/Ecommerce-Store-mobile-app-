import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './providers/auth.dart';
import './providers/users.dart';
import './screens/products_overview.dart';
import './screens/product_detail_screen.dart';
import './screens/home_screen.dart';
import './screens/categories_overview_screen.dart';
import './screens/auth_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: Auth(),
        ),
        // ChangeNotifierProxyProvider<Auth, Users>(
        //   builder: (ctx, auth, previousUsers) => Users(
        //         auth.token,
        //         auth.userId,
        //         previousUsers == null ? [] : previousUsers.items,
        //       ),
        // ),
      ],
      child: Consumer<Auth>(
        builder: (ctx, auth, _) => MaterialApp(
          title: 'E-commerce Store',
          theme: ThemeData(
            primaryColor: Color(0xFFEC407A),
            accentColor: Colors.grey[350],
          ),
          home: auth.isAuth
                  ? HomeScreen()
                  : AuthScreen(),
          routes: {
            HomeScreen.routeName: (ctx) => HomeScreen(),
            ProductDetailScreen.routeName: (ctx) => ProductDetailScreen(),
            ProductsOverviewScreen.routeName: (ctx) => ProductsOverviewScreen(),
            CategoriesOverviewScreen.routeName: (ctx) =>
                CategoriesOverviewScreen(),
          }),
      ),
    );
  }
}
