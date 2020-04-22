import 'package:flutter/material.dart';

import '../models/product.dart';
import '../widgets/product_item.dart';

class ProductsOverviewScreen extends StatelessWidget {

    static const routeName = '/products-overview';

  final List<Product> loadedProducts = [
    
  Product(
    id: '1',
    title: 'Baby Dress',
    description: 'shoe available in all sizes.',
    price: 1120,
    sale: 0,
    imageUrl: 'https://lilchamps.com/content/images/thumbs/0002641_satin-sleeveless-frock-wedding-party-dresses.jpeg',
  ),
  Product(
    id: '2',
    title: 'Boy Dress',
    description: 'shoe available in all sizes.',
    price: 8020,
    sale: 0,
    imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQtK2C5Ag7NyYKx9Odej3a2_kA43ApFe8iQndmanp4A55noatb9',
  ),
  Product(
    id: '3',
    title: 'Mens Suit',
    description: 'shoe available in all sizes.',
    price: 5020,
    sale: 0,
    imageUrl: 'https://cdn.shopify.com/s/files/1/0234/8443/2448/products/product-image-863819584_1024x1024@2x.jpg?v=1566770086',
  ),
  Product(
    id: '4',
    title: 'Women Suit',
    description: 'shoe available in all sizes.',
    price: 2550,
    sale: 0,
    imageUrl: 'https://sc01.alicdn.com/kf/HTB1locCbTZRMeJjSspoq6ACOFXaP.jpg_350x350.jpg',
  ),
  Product(
    id: '5',
    title: 'Ladies Shoes',
    description: 'shoe available in all sizes.',
    price: 1220,
    sale: 0,
    imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTm4sbSXKb-SOaLiDdAWHQc4lFVJD_zfyyoLtxtMLwDSQKRF_Fi',
  ),
  Product(
    id: '6',
    title: 'Male Shoes',
    description: 'shoe available in all sizes.',
    price: 2000,
    sale: 0,
    imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQSk_1KslNBCOEcu5Ud8c_mm_jwA6pKHjoBlWsLz_WfUY_3t05H',
  ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: Text('Product List'),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: IconButton(icon: Icon(Icons.search), onPressed: () {
                }),
          ),
        ],
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(10.0),
        itemCount: loadedProducts.length,
        itemBuilder: (ctx, i) => ProductItem(
              loadedProducts[i].id,
              loadedProducts[i].title,
              loadedProducts[i].description,
              loadedProducts[i].price,
              loadedProducts[i].sale,
              loadedProducts[i].imageUrl,
            ),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 4,
          crossAxisSpacing: 5,
          mainAxisSpacing: 10,
        ),
      ),
    );
  }
}
