import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'card_phase.widget.dart';

class CarouselPhasesIneuj extends StatefulWidget {
  const CarouselPhasesIneuj({super.key});

  @override
  State<CarouselPhasesIneuj> createState() => _CarrouselState();
}

class _CarrouselState extends State<CarouselPhasesIneuj> {
  final CarouselController _controller = CarouselController();
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          // ignore: prefer_const_literals_to_create_immutables
          items: [
            const CardPhase(
              color: Color(0xff95BFBB),
              title: 'CONSTRUÇÃO',
            ),
            const CardPhase(
              color: Color(0xff782749),
              title: 'REVELAÇÃO',
            ),
            const CardPhase(
              color: Color(0xffBF2C2C),
              title: 'CORAGEM',
            ),
            const CardPhase(
              color: Color(0xffD96F32),
              title: 'CONFIANÇA',
            ),
          ],
          options: CarouselOptions(
            enlargeCenterPage: true,
            height: 500,
            aspectRatio: 16 / 9,
            autoPlayCurve: Curves.fastOutSlowIn,
            enableInfiniteScroll: true,
            viewportFraction: 1,
            onPageChanged: (index, reason) {
              setState(() {
                _currentIndex = index;
              });
            },
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: _currentIndex == 0 ? 21 : 10,
              height: 10,
              decoration: BoxDecoration(
                color: _currentIndex == 0
                    ? const Color(0xffD96F32)
                    : const Color(0xff782749),
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            const SizedBox(
              width: 4,
            ),
            Container(
              width: _currentIndex == 1 ? 21 : 10,
              height: 10,
              decoration: BoxDecoration(
                color: _currentIndex == 1
                    ? const Color(0xffD96F32)
                    : const Color(0xff782749),
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            const SizedBox(
              width: 4,
            ),
            Container(
              width: _currentIndex == 2 ? 21 : 10,
              height: 10,
              decoration: BoxDecoration(
                color: _currentIndex == 2
                    ? const Color(0xffD96F32)
                    : const Color(0xff782749),
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
