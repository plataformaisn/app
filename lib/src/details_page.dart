import 'package:app_jogo/src/login_page.dart';
import 'package:app_jogo/src/welcome_page.dart';
import 'package:app_jogo/stores/details.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pay/pay.dart';

import 'widgets/avatar.widget.dart';

final detailStore = Details();

class DetailsPage extends StatefulWidget {
  const DetailsPage({super.key, required this.packName});

  final String packName;

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  Future registeringPackToProfile(paymentResult) async {
    // Send the resulting Apple Pay token to your server / PSP
    logger.i('PACK A SALVAR:', paymentResult);

    var firebaseUser = FirebaseAuth.instance.currentUser;

    FirebaseFirestore.instance
        .collection('profile')
        .doc(firebaseUser!.uid)
        .set({
          'packs': ['Entrelaçar']
        }, SetOptions(merge: true))
        .then((_) => {logger.d('PAck salvo no profile')})
        .catchError((onError) => {logger.e('ERRO AO UPDATE PACK:', onError)});
  }

  @override
  Widget build(BuildContext context) {
    final paymentItems = [
      PaymentItem(
        label: widget.packName,
        amount: '145.00',
        status: PaymentItemStatus.final_price,
      )
    ];
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
                  MaterialPageRoute(builder: (context) => const WelcomePage()),
                );
              },
              child: const Text(
                'Versão demo',
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
              padding: const EdgeInsets.only(left: 21, right: 21, top: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: TextSpan(
                      text: widget.packName,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 40,
                          color: Color(0xff6F2D48)),
                    ),
                  ),
                  const SizedBox(
                    height: 41,
                  ),
                  Observer(
                    builder: (_) => Text(detailStore.descriptionPackMock,
                        style: const TextStyle(fontSize: 15)),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  const Text(
                    'Compre apenas este pack:',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  ApplePayButton(
                    // ignore: deprecated_member_use
                    paymentConfigurationAsset: '/json/apple_pay.json',
                    paymentItems: paymentItems,
                    style: ApplePayButtonStyle.black,
                    type: ApplePayButtonType.buy,
                    width: 200,
                    height: 50,
                    margin: const EdgeInsets.only(bottom: 15.0, top: 5),
                    onPaymentResult: (value) {
                      registeringPackToProfile(value);
                    },
                    onError: (error) {
                      logger.e('ERRO:', error);
                    },
                    loadingIndicator: const Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
                  const Text(
                    'Assine e tenha a todos os packs:',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  ApplePayButton(
                    // ignore: deprecated_member_use
                    paymentConfigurationAsset: '/json/apple_pay.json',
                    paymentItems: paymentItems,
                    style: ApplePayButtonStyle.black,
                    type: ApplePayButtonType.subscribe,
                    width: 200,
                    height: 50,
                    margin: const EdgeInsets.only(bottom: 15.0, top: 5),
                    onPaymentResult: (value) {
                      logger.i('SUCESSO:', value);
                    },
                    onError: (error) {
                      logger.e('ERRO:', error);
                    },
                    loadingIndicator: const Center(
                      child: CircularProgressIndicator(),
                    ),
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
