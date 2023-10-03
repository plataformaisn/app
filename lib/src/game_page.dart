import 'package:app_jogo/src/details_page.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'widgets/avatar.widget.dart';

class PackCards {
  int id;
  String name;
  int color;

  PackCards({required this.id, required this.name, required this.color});
}

class GamePage extends StatefulWidget {
  const GamePage({super.key});

  @override
  State<GamePage> createState() => _PhasesPageState();
}

class _PhasesPageState extends State<GamePage> {
  final List<PackCards> cards = [
    PackCards(id: 0, name: "Qual sua cor predileta?", color: 0xff5BAF33),
    PackCards(id: 1, name: "Qual sua comida predileta?", color: 0xff5BAF33),
    PackCards(id: 2, name: "Quem é seu melhor amigo?", color: 0xff5BAF33),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xffECD2C0),
          actions: const [
            Avatar(),
          ],
        ),
        backgroundColor: const Color(0xffECD2C0),
        persistentFooterButtons: [
          Column(
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff6F2D48),
                  minimumSize: const Size.fromHeight(50),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const DetailsPage(
                              packName: 'Entrelaçar',
                            )),
                  );
                },
                child: const Text(
                  'Adquirir versão completa',
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          )
        ],
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 21, right: 21, top: 66),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  textAlign: TextAlign.left,
                  text: const TextSpan(
                    text: 'Fase 1',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 40,
                        color: Color(0xff6F2D48)),
                  ),
                ),
                const SizedBox(
                  height: 45,
                ),
                CarouselSlider(
                  options: CarouselOptions(
                    height: 400,
                    viewportFraction: 1,
                    initialPage: 1,
                    enableInfiniteScroll: true,
                    reverse: false,
                    autoPlay: false,
                    autoPlayInterval: const Duration(seconds: 3),
                    autoPlayAnimationDuration:
                        const Duration(milliseconds: 800),
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enlargeCenterPage: true,
                    enlargeFactor: 0.2,
                    scrollDirection: Axis.horizontal,
                  ),
                  items: cards.map((pack) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      margin: const EdgeInsets.symmetric(horizontal: 5.0),
                      decoration: BoxDecoration(
                          color: Color(pack.color),
                          borderRadius: BorderRadius.circular(8)),
                      child: GestureDetector(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment:
                              MainAxisAlignment.spaceBetween, // <-- alignments

                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 11, bottom: 5),
                              child: Text(
                                pack.name,
                                textAlign: TextAlign.left,
                                style: const TextStyle(
                                    fontSize: 48.0,
                                    color: Color(0xffECD2C0),
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }).toList(),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text('Arraste para os lados para interagir')
              ],
            ),
          ),
        ));
  }
}
