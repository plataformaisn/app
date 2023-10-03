import 'package:app_jogo/src/login_page.dart';
import 'package:app_jogo/src/widgets/drawer.widget.dart';
import 'package:app_jogo/src/widgets/packs.widget.dart';
import 'package:app_jogo/stores/details.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

final detailStore = Details(); // Instantiate the store

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    createProfile();
  }

  Future createProfile() async {
    var firebaseUser = FirebaseAuth.instance.currentUser;

    if (firebaseUser != null) {
      logger.d('USUÁRIO LOGADO?', firebaseUser);
    } else {
      logger.d('USUÁRIO DESLOGADO?', firebaseUser);
    }
    await FirebaseFirestore.instance
        .collection('profile')
        .doc(firebaseUser?.uid)
        .set({
          'name': firebaseUser?.displayName,
          'uid': firebaseUser?.uid,
          'email': firebaseUser?.email
        })
        .then((_) => {logger.d('PROFILE Criado')})
        .catchError((onError) => {logger.e('ERRO AO UPDATE PACK:', onError)});
  }

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffECD2C0),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding:
              const EdgeInsets.only(left: 24, right: 24, top: 18, bottom: 20),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xff6F2D48),
              minimumSize: const Size.fromHeight(50),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
            ),
            onPressed: () => showDialog<String>(
              context: context,
              builder: (BuildContext context) => Dialog.fullscreen(
                child: Container(
                  decoration: const BoxDecoration(color: Color(0xff782749)),
                  child: Padding(
                    padding:
                        const EdgeInsets.only(top: 32, left: 15, right: 15),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            IconButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                icon: const Icon(
                                  Icons.highlight_off,
                                  color: Color(0xffD96F32),
                                ))
                          ],
                        ),
                        Image.asset(
                          'assets/images/icon_olho_laranja.png',
                          width: 87,
                        ),
                        const Text(
                          'assine e tenha acesso ilimitado',
                          style: TextStyle(
                              color: Color(0xffD96F32),
                              fontSize: 22,
                              fontWeight: FontWeight.w400),
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        const Text(
                          'acabaram as cartas demo desse pack. quer continuar jogando? adquira o acesso ilimitado!',
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                                'assets/images/icon_olho_laranja_pequeno.png'),
                            const Text(
                              'se livre de todos os anúncios',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 14),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                                'assets/images/icon_olho_laranja_pequeno.png'),
                            const Text(
                              'favorite e jogue com suas cartas preferidas',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 14),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                                'assets/images/icon_olho_laranja_pequeno.png'),
                            const Text(
                              'acesso completo e ilimitado a todos os packs',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 14),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                                'assets/images/icon_olho_laranja_pequeno.png'),
                            const Text(
                              'acesso ilimitado a todos os novos jogos',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 14),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                                'assets/images/icon_olho_laranja_pequeno.png'),
                            const Text(
                              'aproveite +300 cartas para você sentir\n muito em diferentes momentos',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 14),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: const Color(0xffD96F32),
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(16), // <-- Radius
                            ),
                          ),
                          onPressed: () {},
                          child: const Padding(
                            padding: EdgeInsets.all(22),
                            child: Text(
                              'todos os packs por RS 13,92/mês',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.transparent,
                              foregroundColor: Colors.black,
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(16), // <-- Radius
                              ),
                              side: const BorderSide(
                                width: 1.0,
                                color: Color(0xffD96F32),
                              )),
                          child: const Padding(
                            padding: EdgeInsets.all(22),
                            child: Text(
                              'Apenas este pack por RS 57,00',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        const Text(
                          'todos os planos são auto-renovável após um ano.\ncancele a qualquer momento.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 9,
                              fontStyle: FontStyle.italic,
                              color: Colors.white),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset('assets/images/icon_cartinhas.png'),
                            SizedBox(
                              width: 7,
                            ),
                            const Text(
                              'Jogar outros packs',
                              textAlign: TextAlign.center,
                              style:
                                  TextStyle(fontSize: 14, color: Colors.white),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.lock_rounded,
                  color: Colors.white,
                  size: 13,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'adquirir assinatura premium',
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
      ),
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
                Icons.menu,
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
      drawer: const DrawerWidget(),
      body: Column(
        children: [
          Image.asset(
            'assets/images/big-eye.png',
            width: 83,
          ),
          RichText(
            text: const TextSpan(
                text: 'Escolha um jogo e',
                style: TextStyle(
                    color: Color(0xff782749),
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
                children: <TextSpan>[
                  TextSpan(
                    text: ' entregue-se:',
                    style: TextStyle(
                        color: Color(0xffBF2C2C),
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  )
                ]),
          ),
          const SizedBox(
            height: 11,
          ),
          const Flexible(child: PacksWidget())
        ],
      ),
    );
  }
}
