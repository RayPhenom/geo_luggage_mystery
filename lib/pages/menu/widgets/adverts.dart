import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:geo_luggage_mystery/pages/menu/widgets/advert_card.dart';


class Adverts extends StatefulWidget {
  const Adverts({super.key});

  @override
  State<Adverts> createState() => _AdvertsState();
}


class _AdvertsState extends State<Adverts> {
  var currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final theme = Theme.of(context);
    final data = [
      AdvertDataClass(title: "title", source: "source", image: "assets/images/easy1.jpg"),
      AdvertDataClass(title: "title", source: "source", image: "assets/images/easy2.jpg"),
      AdvertDataClass(title: "title", source: "source", image: "assets/images/easy3.jpg"),
    ];

    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
              height: screenSize.height * 0.50,
              autoPlay: true,
              autoPlayInterval:
              const Duration(seconds: 3),
              enlargeCenterPage: true,
              enlargeFactor: 0.3,
              autoPlayCurve: Curves.fastOutSlowIn,
              onPageChanged: (index, reason) {
                currentIndex = index;
              }),
          items: data.map((advert) {
            return Builder(
              builder: (BuildContext context) {
                return AdvertCard(
                  image: advert.image,
                  source: advert.source,
                  title: advert.title,
                  description: advert.description,
                );
              },
            );
          }).toList(),
        ),
        DotsIndicator(
          dotsCount: data.length,
          position: currentIndex,
          decorator: DotsDecorator(
              size: const Size.square(9.0),
              activeSize: const Size(18.0, 9.0),
              activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0),
              ),
              activeColor: theme.colorScheme.primary),
        )
      ],
    );
  }
}

class AdvertDataClass {
  final String title;
  final String source;
  final String? description;
  final String image;

  AdvertDataClass({required this.title, required this.source, this.description, required this.image});

}