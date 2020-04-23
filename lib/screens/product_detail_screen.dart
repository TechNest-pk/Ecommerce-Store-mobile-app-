import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class ProductDetailScreen extends StatelessWidget {
  // final String title;
  // final double price;

  // ProductDetailScreen(this.title, this.price);
  static const routeName = '/product-detail';

  @override
  Widget build(BuildContext context) {
    // final productId = ModalRoute.of(context).settings.arguments as String; // is the id!
    // ...
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: Text('Baby Dress'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 10
            ),
            Text(
              'Rs: 1120',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            ),
            SizedBox(
              height: 10
            ),
            ProductList(),
            SizedBox(
              height: 10
            ),
            // Container(
            //   width: double.infinity,
            //   child: Text(
            //     '',
            //     textAlign: TextAlign.center,
            //     softWrap: true,
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}

class ProductList extends StatefulWidget {
   @override
  _ProductListState createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {

List _productsImg = [
    'https://lilchamps.com/content/images/thumbs/0002641_satin-sleeveless-frock-wedding-party-dresses.jpeg',
    'https://lilchamps.com/content/images/thumbs/0002641_satin-sleeveless-frock-wedding-party-dresses.jpeg',
    'https://lilchamps.com/content/images/thumbs/0002641_satin-sleeveless-frock-wedding-party-dresses.jpeg',
  ];

  int _current = 0;

  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            CarouselSlider(
              aspectRatio: 16/9,
              initialPage: 0,
              scrollDirection: Axis.horizontal,
              onPageChanged: (index) {
              setState(() {
                _current = index;
              });
            },
              items: _productsImg.map((imgUrl) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.symmetric(horizontal: 10.0),
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(9.0),
                        child: Image.network(
                          imgUrl,
                          fit: BoxFit.fill,
                        ),
                      ),
                    );
                  },
                );
              }).toList(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: map<Widget>(_productsImg, (index, url) {
                return Container(
                  width: 10.0,
                  height: 10.0,
                  margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _current == index ? Theme.of(context).primaryColor : Theme.of(context).accentColor,
                  ),
                );
              }),
            ),
          ]),
    );
  }
}
