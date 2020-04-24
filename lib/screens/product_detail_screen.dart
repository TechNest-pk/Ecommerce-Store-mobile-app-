import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class ProductDetailScreen extends StatefulWidget {
  static const routeName = '/product-detail';

  @override
  _ProductDetailScreenState createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    _tabController = new TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: Text('Baby Dress'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(height: 10),
            SizedBox(height: 10),
            ProductList(),
            Container(
              // decoration:
              //     new BoxDecoration(color: Theme.of(context).primaryColor),
              child: new TabBar(
                controller: _tabController,
                unselectedLabelColor: Theme.of(context).accentColor,
                labelColor: Theme.of(context).primaryColor,
                indicatorColor: Theme.of(context).primaryColor,
                tabs: [
                  Tab(
                    text: 'Details',
                  ),
                  Tab(text: 'Reviews')
                ],
              ),
            ),
            new Container(
              height: MediaQuery.of(context).size.height / 2.9,
              child: new TabBarView(
                controller: _tabController,
                children: <Widget>[
                  ListView(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Product Details:',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 10, 10, 10),
                        child: Text(
                            'Details of product is baby dress is available in all sizes of age 4 to 12.'),
                      ),
                    ],
                  ),
                  ListView(
                    children: <Widget>[
                      ListTile(
                        title: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            ClipRRect(
                              borderRadius: BorderRadius.circular(30),
                              child: Container(
                                height: 20,
                                width: 100,
                                color: Colors.grey,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Icon(Icons.star,
                                        size: 15, color: Colors.red),
                                    Icon(Icons.star,
                                        size: 15, color: Colors.red),
                                    Icon(
                                      Icons.star,
                                      size: 15,
                                      color: Colors.red,
                                    ),
                                    Icon(
                                      Icons.star,
                                      size: 15,
                                    ),
                                    Icon(
                                      Icons.star,
                                      size: 15,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Text(
                              'Batool Ali',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'This frock is pretty good and the quality is awesome.',
                              style: TextStyle(
                                color: Theme.of(context).accentColor,
                              ),
                            ),
                          ],
                        ),
                        leading: Container(
                          width: 50,
                          height: 50,
                          child: CircleAvatar(
                            backgroundImage: NetworkImage(''),
                            backgroundColor: Theme.of(context).accentColor,
                          ),
                        ),
                        // trailing: Container(
                        //   width: 80,
                        //   child:
                        // ),
                      ),
                      Divider(),
                      ListTile(
                        title: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            ClipRRect(
                              borderRadius: BorderRadius.circular(30),
                              child: Container(
                                height: 20,
                                width: 100,
                                color: Colors.grey,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Icon(Icons.star,
                                        size: 15, color: Colors.red),
                                    Icon(Icons.star,
                                        size: 15, color: Colors.red),
                                    Icon(
                                      Icons.star,
                                      size: 15,
                                      color: Colors.red,
                                    ),
                                    Icon(
                                      Icons.star,
                                      size: 15,
                                    ),
                                    Icon(
                                      Icons.star,
                                      size: 15,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Text(
                              'Batool Ali',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'This frock is pretty good and the quality is awesome.',
                              style: TextStyle(
                                color: Theme.of(context).accentColor,
                              ),
                            ),
                          ],
                        ),
                        leading: Container(
                          width: 50,
                          height: 50,
                          child: CircleAvatar(
                            backgroundImage: NetworkImage(''),
                            backgroundColor: Theme.of(context).accentColor,
                          ),
                        ),
                        // trailing: Container(
                        //   width: 80,
                        //   child:
                        // ),
                      ),
                      Divider(),
                      ListTile(
                        title: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            ClipRRect(
                              borderRadius: BorderRadius.circular(30),
                              child: Container(
                                height: 20,
                                width: 100,
                                color: Colors.grey,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Icon(Icons.star,
                                        size: 15, color: Colors.red),
                                    Icon(Icons.star,
                                        size: 15, color: Colors.red),
                                    Icon(
                                      Icons.star,
                                      size: 15,
                                      color: Colors.red,
                                    ),
                                    Icon(
                                      Icons.star,
                                      size: 15,
                                    ),
                                    Icon(
                                      Icons.star,
                                      size: 15,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Text(
                              'Batool Ali',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'This frock is pretty good and the quality is awesome.',
                              style: TextStyle(
                                color: Theme.of(context).accentColor,
                              ),
                            ),
                          ],
                        ),
                        leading: Container(
                          width: 50,
                          height: 50,
                          child: CircleAvatar(
                            backgroundImage: NetworkImage(''),
                            backgroundColor: Theme.of(context).accentColor,
                          ),
                        ),
                        // trailing: Container(
                        //   width: 80,
                        //   child:
                        // ),
                      ),
                      Divider(),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              width: 200,
              child: RaisedButton(
                  color: Theme.of(context).primaryColor,
                  textColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(Icons.shopping_cart),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'ADD TO CART',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                  onPressed: () {}),
            )
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
                      child: Stack(
                        fit: StackFit.expand,
                        children: <Widget>[
                          Card(
                            color: Colors.grey[300],
                            child: Image.network(
                              imgUrl,
                              fit: BoxFit.fill,
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomLeft,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                ' Rs: 1120 ',
                                style: TextStyle(
                                  backgroundColor:
                                      Colors.white70.withOpacity(0.7),
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ),
                        ],
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
                    color: _current == index
                        ? Theme.of(context).primaryColor
                        : Theme.of(context).accentColor,
                  ),
                );
              }),
            ),
          ]),
    );
  }
}
