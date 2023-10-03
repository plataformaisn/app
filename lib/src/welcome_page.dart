import 'package:app_jogo/src/login_page.dart';
import 'package:app_jogo/src/phases_page.dart';
import 'package:app_jogo/stores/details.dart';
import 'package:flutter/material.dart';

import 'widgets/avatar.widget.dart';

final detailStore = Details();

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  void onApplePayResult(paymentResult) {
    // Send the resulting Apple Pay token to your server / PSP
    logger.i('TENTANDO PAGAR:', paymentResult);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffECD2C0),
        actions: const [
          Avatar(),
        ],
      ),
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
                  MaterialPageRoute(builder: (context) => const PhasesPage()),
                );
              },
              child: const Text(
                'Jogar',
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        )
      ],
      backgroundColor: const Color(0xffECD2C0),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 21, right: 21, top: 66),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: const TextSpan(
                        text: 'Seja muito\n bem vindx',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 40,
                            color: Color(0xff6F2D48)),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 41,
                  ),
                  const Text(
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec vitae eleifend urna, quis rutrum orci. Donec imperdiet vel metus ac viverra. Pellentesque pulvinar, odio non accumsan pharetra, odio neque pulvinar purus, in accumsan nunc turpis ut orci. Maecenas venenatis tortor metus, non lacinia sapien ullamcorper ac. Vestibulum posuere velit faucibus urna sollicitudin molestie. Nunc viverra.'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
