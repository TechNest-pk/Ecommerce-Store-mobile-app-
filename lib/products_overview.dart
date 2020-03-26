import 'package:flutter/material.dart';

import './models/product.dart';
import './widgets/product_item.dart';

class ProductsOverviewScreen extends StatelessWidget {

    static const routeName = '/products-overview';

  final List<Product> loadedProducts = [
    
  Product(
    id: '1',
    title: 'shoes 1',
    description: 'shoe available in all sizes.',
    price: 20.0,
    sale: 0,
    imageUrl: 'https://contents.mediadecathlon.com/p1419921/k\$72b461620e3e5ec61db942355362dd66/8486177.jpg?&f=x',
  ),
  Product(
    id: '2',
    title: 'shoes 2',
    description: 'shoe available in all sizes.',
    price: 20.0,
    sale: 0,
    imageUrl: 'https://contents.mediadecathlon.com/p1419921/k\$72b461620e3e5ec61db942355362dd66/8486177.jpg?&f=x',
  ),
  Product(
    id: '3',
    title: 'shoes 3',
    description: 'shoe available in all sizes.',
    price: 20.0,
    sale: 0,
    imageUrl: 'https://contents.mediadecathlon.com/p1419921/k\$72b461620e3e5ec61db942355362dd66/8486177.jpg?&f=x',
  ),
  Product(
    id: '4',
    title: 'shoes 4',
    description: 'shoe available in all sizes.',
    price: 20.0,
    sale: 0,
    imageUrl: 'https://contents.mediadecathlon.com/p1419921/k\$72b461620e3e5ec61db942355362dd66/8486177.jpg?&f=x',
  ),
  Product(
    id: '5',
    title: 'shoes 5',
    description: 'shoe available in all sizes.',
    price: 20.0,
    sale: 0,
    imageUrl: 'https://contents.mediadecathlon.com/p1419921/k\$72b461620e3e5ec61db942355362dd66/8486177.jpg?&f=x',
  ),
  Product(
    id: '6',
    title: 'shoes 6',
    description: 'shoe available in all sizes.',
    price: 20.0,
    sale: 0,
    imageUrl: 'https://contents.mediadecathlon.com/p1419921/k\$72b461620e3e5ec61db942355362dd66/8486177.jpg?&f=x',
  ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Store'),
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
