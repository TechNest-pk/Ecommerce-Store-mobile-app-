import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class NewArrival extends StatelessWidget {
  List _imgList = [
    'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQ4lrIdut3UKnYdwZ84MduWhGNhkdVyHGWWhXNAW8z6rFAtEqPU',
    'https://i.ytimg.com/vi/jiBL43AmAO4/maxresdefault.jpg',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQF2KEWUxozG_A1sKdWVpeyuA1mfEUCF-rvmkZNnXvZ03X7LOsp',
    'https://i.ytimg.com/vi/6AnFrFDn0KU/maxresdefault.jpg',
    'https://image.made-in-china.com/2f0j00vdDEAmyMPtqO/Blue-Ball-Gowns-3D-Flowers-Tulle-Wedding-Bridal-Dresses-Z5004.jpg'
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
                height: 150,
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
                          color: Colors.white,
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
