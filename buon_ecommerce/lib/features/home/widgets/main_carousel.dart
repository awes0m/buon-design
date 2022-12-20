// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:buon_ecommerce/utils/constants.dart';
import 'package:buon_ecommerce/utils/globals/screen_helper.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../services/repositories/carousel_items.dart';

class MainCarousel extends StatefulWidget {
  final double width;

  const MainCarousel({
    Key? key,
    required this.width,
  }) : super(key: key);

  @override
  State<MainCarousel> createState() => _MainCarouselState();
}

class _MainCarouselState extends State<MainCarousel> {
  int _current = 0;
  final CarouselController _controller = CarouselController();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      for (var imageUrl in imgList) {
        precacheImage(NetworkImage(imageUrl), context);
      }
    });
    super.initState();
  }

  late List<Widget> imageSliders = imgList
      .map((item) => Container(
            width: widget.width,
            margin: const EdgeInsets.symmetric(vertical: 5.0),
            child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                child: Stack(
                  children: <Widget>[
                    Image.network(item,
                        fit: BoxFit.fitHeight, width: widget.width),
                    Positioned(
                      bottom: 0.0,
                      left: 0.0,
                      right: 0.0,
                      child: Container(
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Color.fromARGB(200, 0, 0, 0),
                              Color.fromARGB(0, 0, 0, 0)
                            ],
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                          ),
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Text(
                          'No. ${imgList.indexOf(item)} image',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                )),
          ))
      .toList();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: ScreenHelper.isMobile(context)
          ? 250
          : getMobileMaxHeight(context) * 0.6,
      child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
        Expanded(
          child: CarouselSlider(
            items: imageSliders,
            carouselController: _controller,
            options: CarouselOptions(
                autoPlay: true,
                viewportFraction: 1,
                // enlargeCenterPage: true,
                aspectRatio: ScreenHelper.isMobile(context)
                    ? 2
                    : getMaxWidth(context) * 2 / getMobileMaxHeight(context),
                onPageChanged: (index, reason) {
                  setState(() {
                    _current = index;
                  });
                }),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: imgList.asMap().entries.map((entry) {
            return GestureDetector(
              onTap: () => _controller.animateToPage(entry.key),
              child: Container(
                width: 5.0,
                height: 5.0,
                margin:
                    const EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: (Theme.of(context).brightness == Brightness.dark
                            ? kAuxColor
                            : kPrimaryColor)
                        .withOpacity(_current == entry.key ? 0.9 : 0.4)),
              ),
            );
          }).toList(),
        ),
      ]),
    );
  }
}
