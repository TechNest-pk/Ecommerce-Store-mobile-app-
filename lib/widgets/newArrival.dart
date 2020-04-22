import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class NewArrival extends StatelessWidget {
  List _imgList = [
    'https://i.pinimg.com/originals/ef/f7/a6/eff7a62c0fdd65f3879c29d6700de36d.jpg',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRzGcuhMQSOTQgVC8NCJj3hU9z2gifuG13J3KIQRuqBLmiO4Q2Q&usqp=CAU',
    'https://image.freepik.com/free-vector/winter-sale-banner-template-fashion-stores_9111-1054.jpg',
    'https://i.ytimg.com/vi/6AnFrFDn0KU/maxresdefault.jpg',
    'https://smdanishiqbal.github.io/HyperBazaar/images/cat3.jpg',
    'https://suvidhashopping.com/images/banner/topbanner/BAN1_1551250249_GE5PMJUK.png'
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CarouselSlider(
                height: 200,
                initialPage: 0,
                enlargeCenterPage: true,
                autoPlay: true,
                reverse: false,
                enableInfiniteScroll: true,
                autoPlayInterval: Duration(seconds: 2),
                autoPlayAnimationDuration: Duration(milliseconds: 2000),
                pauseAutoPlayOnTouch: Duration(seconds: 10),
                scrollDirection: Axis.horizontal,
                items: _imgList.map((imgUrl) {
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
            ),
           
          ]),
    );
  }
}
