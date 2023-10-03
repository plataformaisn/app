import 'package:app_jogo/src/phases_page.dart';
import 'package:app_jogo/src/widgets/card_thumb.widget.dart';
import 'package:flutter/material.dart';

class PacksWidget extends StatefulWidget {
  const PacksWidget({super.key});

  @override
  State<PacksWidget> createState() => _PacksWidgetState();
}

class _PacksWidgetState extends State<PacksWidget> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      padding: const EdgeInsets.only(left: 22, right: 22),
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const PhasesPage()),
                );
              },
              child: CardThumbWidget(
                isCustomTitle: false,
                isNew: true,
                subTitle: Text(
                  'Para se conectar',
                  style: TextStyle(
                      color: Color(0xff782749),
                      fontSize: 14,
                      fontWeight: FontWeight.bold),
                ),
                title: 'Isso não é um jogo',
                backgroundImage: 'assets/images/bg_smile.png',
              ),
            ),
            CardThumbWidget(
              isNew: true,
              isCustomTitle: true,
              customTitle: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'E',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 9),
                    child: Text(
                      'N',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Text(
                    'T',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 9),
                    child: Text(
                      'R',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Text(
                    'E',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 9),
                    child: Text(
                      'L',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Text(
                    'A',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 9),
                    child: Text(
                      'Ç',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Text(
                    'A',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 9),
                    child: Text(
                      'R',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              subTitle: Text(
                'Criando laços\n [sem dar nós]',
                style: TextStyle(
                    color: Color(0xff782749),
                    fontSize: 14,
                    fontWeight: FontWeight.bold),
              ),
              title: 'Isso não é um jogo',
              backgroundImage: 'assets/images/bg_coracao.png',
            ),
          ],
        ),
        SizedBox(
          height: 13,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CardThumbWidget(
              isCustomTitle: false,
              isNew: true,
              subTitle: Text(
                'Para falar sobre\n a vida e morte',
                style: TextStyle(
                    color: Color(0xff782749),
                    fontSize: 13,
                    fontWeight: FontWeight.bold),
              ),
              title: 'Eternizar',
              backgroundImage: 'assets/images/bg_stars.png',
            ),
            CardThumbWidget(
              isCustomTitle: false,
              isNew: true,
              subTitle: Text(
                'Jogue com suas\n cartas favoritas',
                style: TextStyle(
                    color: Color(0xff782749),
                    fontSize: 14,
                    fontWeight: FontWeight.bold),
              ),
              title: 'Favoritos',
              backgroundImage: 'assets/images/bg_intimidade.png',
            ),
          ],
        ),
      ],
    );
  }
}
