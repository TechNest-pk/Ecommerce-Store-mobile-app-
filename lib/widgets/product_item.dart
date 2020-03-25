import 'package:flutter/material.dart';

import '../product_detail_screen.dart';

class ProductItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  final String description;
  final double price;
  final int sale;

  ProductItem(this.id, this.title, this.description, this.price, this.sale,
      this.imageUrl);

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
          child: Column(
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width / 2,
                child: Image.network(
                  imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
              Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                'Rs: ' + price.toString(),
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),

              // IconButton(
              //   icon: Icon(
              //     Icons.shopping_cart,
              //   ),
              //   onPressed: () {},
              //   color: Theme.of(context).accentColor,
              // ),
            ],
          ),
        ),
      ),
      // footer: GridTileBar(
      //   backgroundColor: Colors.black87,
      //   leading: IconButton(
      //     icon: Icon(Icons.favorite),
      //     color: Theme.of(context).accentColor,
      //     onPressed: () {},
      //   ),
      //   title: Text(
      //     title,
      //     textAlign: TextAlign.center,
      //   ),
      //   trailing: IconButton(
      //     icon: Icon(
      //       Icons.shopping_cart,
      //     ),
      //     onPressed: () {},
      //     color: Theme.of(context).accentColor,
      //   ),
      // ),
    );
  }
}
