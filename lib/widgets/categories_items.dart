import 'dart:ui';
import 'package:flutter/material.dart';

import '../screens/product_detail_screen.dart';

class CategorieItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;

  CategorieItem(this.id, this.title, this.imageUrl);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Card(
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(
              ProductDetailScreen.routeName,
              arguments: id,
            );
          },
          child: Stack(
            children: <Widget>[
              Container(
                height: 220,
                width: MediaQuery.of(context).size.width / 2,
                child: Image.network(
                  imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
              BackdropFilter(
                filter: new ImageFilter.blur(sigmaX: 1, sigmaY: 1),
                child: new Align(
                  alignment: Alignment.center,
                  child: OutlineButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed(
                        ProductDetailScreen.routeName,
                        arguments: id,
                      );
                    },
                    child: Text(
                      title,
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                    borderSide: BorderSide(
                      color: Colors.white, //Color of the border
                      style: BorderStyle.solid, //Style of the border
                      width: 2, //width of the border
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
