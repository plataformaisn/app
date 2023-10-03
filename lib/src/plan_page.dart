import 'package:app_jogo/stores/details.dart';
import 'package:flutter/material.dart';

import 'widgets/avatar.widget.dart';

final detailStore = Details(); // Instantiate the store

class PlanPage extends StatefulWidget {
  const PlanPage({super.key});

  @override
  State<PlanPage> createState() => _PlanPageState();
}

class _PlanPageState extends State<PlanPage> {
  final String currencySymbol = "R\$";

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
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 21, right: 21, top: 66),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: const TextSpan(
                      text: 'Conheça\n',
                      children: <TextSpan>[
                        TextSpan(
                            text: 'Nosso plano',
                            style: TextStyle(fontWeight: FontWeight.w300)),
                      ],
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 40,
                          color: Color(0xff6F2D48)),
                    ),
                  ),
                  const SizedBox(
                    height: 41,
                  ),
                  const Text('Plano anual',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                          color: Color(0xff6F2D48))),
                  Text(
                    'Pague apenas $currencySymbol 145,00 em seu cartão de crédito, e tenha acesso a toda a lista de jogos do Isso não é um jogo.',
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    '* A validade do seu plano se mantêm enquanto a assinatura estiver ativa',
                    style: TextStyle(fontSize: 12),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    '* No modelo de assinatura jogos não são vitalícios, enquanto houver assinatura ativa, os jogos estarão disponíveis em sua galeria de jogos.',
                    style: TextStyle(fontSize: 12),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    '* Assinatura válida por 12 meses corridos',
                    style: TextStyle(fontSize: 12),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                      backgroundColor: const Color(0xff6F2D48),
                      minimumSize: const Size.fromHeight(50), // NEW
                    ),
                    onPressed: () {},
                    child: const Text(
                      'Assinar',
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),

                  /*  Observer(
                    builder: (_) => Text(detailStore.value,
                        style: const TextStyle(fontSize: 15)),
                  ), */
                  const SizedBox(
                    height: 41,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
