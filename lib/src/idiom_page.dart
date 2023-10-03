import 'package:app_jogo/src/intro_page.dart';
import 'package:flutter/material.dart';

class IdiomPage extends StatefulWidget {
  const IdiomPage({super.key});

  @override
  State<IdiomPage> createState() => _IdiomPageState();
}

class _IdiomPageState extends State<IdiomPage> {
  int _value = 1;
  String _titleOne = 'Escolha o idioma';

  String getIdiom(int idiomSelected) {
    if (idiomSelected == 1) {
      setState(() => _titleOne = 'Escolha o idioma:');
      return 'ptbr';
    } else if (idiomSelected == 2) {
      setState(() => _titleOne = 'Choose your language:');
      return 'eua';
    } else if (idiomSelected == 3) {
      setState(() => _titleOne = 'Escolha teu idioma:');
      return 'pt';
    } else {
      setState(() => _titleOne = 'Seleccione su idioma');
      return 'es';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xffECD2C0),
        bottomSheet: Container(
          height: 422,
          width: double.infinity,
          clipBehavior: Clip.antiAlias,
          decoration: const BoxDecoration(
            color: Color(0xff6F2D48),
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(32.0),
                topRight: Radius.circular(32.0)),
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 25),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  _titleOne,
                  style: const TextStyle(fontSize: 28, color: Colors.white),
                ),
                const SizedBox(
                  height: 37,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const IntroPage()),
                            );
                          },
                          child: InkWell(
                            child: Column(
                              children: [
                                Image.asset('assets/images/ptbr.png'),
                                const SizedBox(
                                  height: 15,
                                ),
                                const Text(
                                  'Português[PT/BR]',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      width: 60,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const IntroPage()),
                        );
                      },
                      child: InkWell(
                        child: Column(
                          children: [
                            Image.asset('assets/images/eua.png'),
                            const SizedBox(
                              height: 15,
                            ),
                            const Text(
                              'Inglês[EN]',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const IntroPage()),
                        );
                      },
                      child: InkWell(
                        child: Column(
                          children: [
                            Image.asset('assets/images/es.png'),
                            const SizedBox(
                              height: 15,
                            ),
                            const Text(
                              'Espanhol[ES]',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 50,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const IntroPage()),
                        );
                      },
                      child: InkWell(
                        child: Column(
                          children: [
                            Image.asset('assets/images/pt.png'),
                            const SizedBox(
                              height: 15,
                            ),
                            const Text(
                              'Português[PT]',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/big-eye.png'),
              const SizedBox(
                height: 255,
              )
            ],
          ),
        ));
  }
}
