import 'package:flutter/material.dart';

import '../products_overview.dart';

class PopularItems extends StatelessWidget {

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
        height: MediaQuery.of(context).size.height * 3 / 13,
        child: ListView.builder(
          itemCount: imgList.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext context, int index) => Container(
              width: 90,
              margin: EdgeInsets.symmetric(horizontal: 5),
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context)
          .pushNamed(ProductsOverviewScreen.routeName);
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(9),
                                  child: Image.network(
                    imgList[index],
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
        ),
      ),
    );
  }
}