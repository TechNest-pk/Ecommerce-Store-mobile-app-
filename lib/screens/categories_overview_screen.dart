import 'package:flutter/material.dart';

import '../models/categories.dart';
import '../widgets/categories_items.dart';

class CategoriesOverviewScreen extends StatelessWidget {

    static const routeName = '/categories-overview';

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
    title: 'Makeup',
    imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQtbqRqrDShn8zqknIBFCstTn9vQupSqv2MR3t82Hxdyco5PkzQ',
  ),
  Categorie(
    id: '8',
    title: 'Mens Products',
    imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcT14NJ4eNJzRwmKA2kRLEcd4torqm2F0wKJxbakpWHQezjNsw-a',
  ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Categories'),
      // ),
      backgroundColor: Colors.grey[300],
      body: GridView.builder(
        padding: const EdgeInsets.all(10.0),
        itemCount: loadedProducts.length,
        itemBuilder: (ctx, i) => CategorieItem(
              loadedProducts[i].id,
              loadedProducts[i].title,
              loadedProducts[i].imageUrl,
            ),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 4,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
      ),
    );
  }
}
