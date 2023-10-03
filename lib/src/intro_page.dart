import 'package:app_jogo/src/home_page.dart';
import 'package:app_jogo/src/login_page.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({super.key});

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  final CarouselController _controller = CarouselController();
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  renderBackgroundImage() {
    if (_currentIndex == 0) {
      return AssetImage("assets/images/bg_intro_1.png");
    } else if (_currentIndex == 1) {
      return AssetImage("assets/images/bg_intro_2.png");
    } else {
      return AssetImage("assets/images/bg_intro_3.png");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xffECD2C0),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: renderBackgroundImage(),
              fit: BoxFit.fill,
            ),
          ),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(23, 49, 24, 15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CarouselSlider(
                    carouselController: _controller,
                    items: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset("assets/images/asset_intro_1.png"),
                          const Flexible(
                              child: SizedBox(
                            width: 290,
                            child: Column(
                              children: [
                                Text(
                                  "FEITO PARA TODOS QUE\n SENTEM MUITO",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Color(0xff782749),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 13,
                                  ),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Text(
                                  'para jogar sozinho, com os amigos, com a família, companheiro(a), crushes. O nosso objetivo é que você se conecte ainda mais com quem está do seu lado, não importa qual pack você escolher jogar',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Color(0xff782749),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 13,
                                  ),
                                ),
                              ],
                            ),
                          )),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset("assets/images/asset_intro_2.png"),
                          const Flexible(
                              child: SizedBox(
                            width: 309,
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 15,
                                ),
                                Text(
                                  'sugerimos que você coloque seu celular em MODO AVIÃO e esteja de corpo e alma para OUVIR atentamente e compartilhar inteiramente',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Color(0xff782749),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 13,
                                  ),
                                ),
                              ],
                            ),
                          )),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset("assets/images/asset_intro_3.png"),
                          const Flexible(
                              child: SizedBox(
                            width: 309,
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 15,
                                ),
                                Text(
                                  'Se permita ser vulnerável, somente assim há conexões verdadeiras.\n Quanto mais entrega, mais você ganha!',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Color(0xff782749),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 13,
                                  ),
                                ),
                              ],
                            ),
                          )),
                        ],
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
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: _currentIndex == 0 ? 21 : 10,
                            height: 10,
                            decoration: BoxDecoration(
                              color: _currentIndex == 0
                                  ? const Color(0xff782749)
                                  : const Color(0xffD96F32),
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
                                  ? const Color(0xff782749)
                                  : const Color(0xffD96F32),
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
                                  ? const Color(0xff782749)
                                  : const Color(0xffD96F32),
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        width: 4,
                        height: 15,
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xff6F2D48),
                          minimumSize: const Size.fromHeight(50),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                        ),
                        onPressed: () => {
                          _currentIndex == 2
                              ? Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const HomePage()),
                                )
                              : _controller.nextPage(),
                        },
                        child: const Text(
                          'Próximo',
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                              child: _currentIndex > 0
                                  ? IconButton(
                                      onPressed: () => {
                                        _controller.previousPage(),
                                      },
                                      icon: const Icon(
                                        Icons.arrow_back,
                                        size: 24,
                                      ),
                                    )
                                  : const SizedBox(
                                      height: 48,
                                    )),
                          Container(
                            child: _currentIndex < 2
                                ? TextButton(
                                    style: TextButton.styleFrom(
                                      textStyle: const TextStyle(
                                        fontSize: 16,
                                      ),
                                    ),
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const HomePage()),
                                      );
                                    },
                                    child: const Text(
                                      'Pular',
                                      style: TextStyle(
                                          color: Color(0xff782749),
                                          fontWeight: FontWeight.bold),
                                    ),
                                  )
                                : null,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
