import 'package:app_jogo/src/widgets/card_phase.widget.dart';
import 'package:app_jogo/src/widgets/carousel_phases_ineuj.widget.dart';
import 'package:flutter/material.dart';

import 'package:carousel_slider/carousel_slider.dart';

class PhasesPage extends StatefulWidget {
  const PhasesPage({super.key});

  @override
  State<PhasesPage> createState() => _PhasesPageState();
}

class _PhasesPageState extends State<PhasesPage> {
  final List<String> entries = <String>['A', 'B', 'C'];
  final List<int> colorCodes = <int>[600, 500, 100];

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          key: _scaffoldKey,
          backgroundColor: const Color(0xffECD2C0),
          actions: const [
            //Avatar(),
            Padding(
              padding: EdgeInsets.only(right: 22),
              child: Row(
                children: [
                  Icon(
                    Icons.help,
                    size: 35,
                    color: Color(0xff6F2D48),
                  ),
                ],
              ),
            )
          ],
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: const Icon(
                  Icons.arrow_back,
                  size: 45,
                  color: Color(0xff782749),
                ),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
              );
            },
          ),
        ),
        backgroundColor: const Color(0xffECD2C0),
        body: const SafeArea(
          child: Padding(
            padding: EdgeInsets.only(left: 21, right: 21, top: 66),
            child: Column(children: [
              Text(
                'escolha uma fase e se jogue:',
                style: TextStyle(
                    color: Color(0xff782749),
                    fontSize: 19,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 47,
              ),
              CarouselPhasesIneuj()
            ]),
          ),
        ));
  }
}
