import 'package:flutter/material.dart';

import './widgets/Categories_circle.dart';
import './widgets/newArrival.dart';
import './widgets/popular_items.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('E-Commerce Store')),
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height / 4,
              decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                        'https://datsgreathome.files.wordpress.com/2019/11/women-fashion.jpg?w=770'),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(8.0)),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Text(
                  '',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 28),
                ),
              ),
            ),
            Flexible(
              child: CategoriesCircle(),
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Text(
                  'New Arrivals',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                GestureDetector(
                  child: Text(
                    'See All',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                      decoration: TextDecoration.underline,
                      decorationThickness: 2.85,
                    ),
                  ),
                ),
              ],
            ),
            NewArrival(),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Text(
                  'Popular Items',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                GestureDetector(
                  child: Text(
                    'See All',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                      decoration: TextDecoration.underline,
                      decorationThickness: 2.85,
                    ),
                  ),
                ),
              ],
            ),
            PopularItems(),
          ],
        ),
      ),
    );
  }
}
