import 'package:flutter/material.dart';

// import '../screens/products_overview.dart';
import '../screens/categories_overview_screen.dart';
import '../models/categories.dart';

class CategoriesCircle extends StatefulWidget {
  @override
  _CategoriesCircleState createState() => _CategoriesCircleState();
}

class _CategoriesCircleState extends State<CategoriesCircle> {
  final List<Categorie> loadedProducts = [
    
  Categorie(
    id: '1',
    title: 'Girls',
    imageUrl: 'https://lilchamps.com/content/images/thumbs/0002641_satin-sleeveless-frock-wedding-party-dresses.jpeg',
  ),
  Categorie(
    id: '2',
    title: 'Kids',
   imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQtK2C5Ag7NyYKx9Odej3a2_kA43ApFe8iQndmanp4A55noatb9',
  ),
  Categorie(
    id: '3',
    title: 'Mens',
    imageUrl: 'https://cdn.shopify.com/s/files/1/0234/8443/2448/products/product-image-863819584_1024x1024@2x.jpg?v=1566770086',
  ),
  Categorie(
    id: '4',
    title: 'Womens',
    imageUrl: 'https://sc01.alicdn.com/kf/HTB1locCbTZRMeJjSspoq6ACOFXaP.jpg_350x350.jpg',
  ),
  Categorie(
    id: '5',
    title: 'Ladies Shoes',
    imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTm4sbSXKb-SOaLiDdAWHQc4lFVJD_zfyyoLtxtMLwDSQKRF_Fi',
  ),
  Categorie(
    id: '6',
    title: 'Mens Shoes',
    imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQSk_1KslNBCOEcu5Ud8c_mm_jwA6pKHjoBlWsLz_WfUY_3t05H',
  ),
  Categorie(
    id: '7',
    title: 'Mens Shoes',
    imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQtbqRqrDShn8zqknIBFCstTn9vQupSqv2MR3t82Hxdyco5PkzQ',
  ),
  Categorie(
    id: '8',
    title: 'Mens Shoes',
    imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcT14NJ4eNJzRwmKA2kRLEcd4torqm2F0wKJxbakpWHQezjNsw-a',
  ),
  ];

  List imgList = [
    'https://lilchamps.com/content/images/thumbs/0002641_satin-sleeveless-frock-wedding-party-dresses.jpeg',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQtK2C5Ag7NyYKx9Odej3a2_kA43ApFe8iQndmanp4A55noatb9',
    'https://cdn.shopify.com/s/files/1/0234/8443/2448/products/product-image-863819584_1024x1024@2x.jpg?v=1566770086',
    'https://sc01.alicdn.com/kf/HTB1locCbTZRMeJjSspoq6ACOFXaP.jpg_350x350.jpg',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTm4sbSXKb-SOaLiDdAWHQc4lFVJD_zfyyoLtxtMLwDSQKRF_Fi',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQSk_1KslNBCOEcu5Ud8c_mm_jwA6pKHjoBlWsLz_WfUY_3t05H',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQtbqRqrDShn8zqknIBFCstTn9vQupSqv2MR3t82Hxdyco5PkzQ',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcT14NJ4eNJzRwmKA2kRLEcd4torqm2F0wKJxbakpWHQezjNsw-a'
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 70,
        child: ListView.builder(
          itemCount: loadedProducts.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext context, int index) => Container(
            width: 60,
            margin: EdgeInsets.symmetric(horizontal: 5),
            decoration: BoxDecoration(
              color: Colors.transparent,
            ),
            child: GestureDetector(
              onTap: () {
                Navigator.of(context)
                    .pushNamed(CategoriesOverviewScreen.routeName);
              },
              child: Column(
                children: <Widget>[
                  CircleAvatar(
                    radius: 25,
                    backgroundColor: Theme.of(context).accentColor,
                    backgroundImage: NetworkImage(loadedProducts[index].imageUrl),
                  ),
                  Text(loadedProducts[index].title,
                  style: TextStyle(
                    fontSize: 9,
                    color: Theme.of(context).accentColor,
                  ),
                  ),
                ],
              ),
              // Image.network(
              //   imgList[index],
              //   fit: BoxFit.fill,
              // ),
            ),
          ),
        ),
      ),
    );
  }
}
