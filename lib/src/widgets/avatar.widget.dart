import 'package:app_jogo/src/idiom_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class Avatar extends StatefulWidget {
  const Avatar({super.key});

  @override
  State<Avatar> createState() => _AvatarState();
}

class _AvatarState extends State<Avatar> {
  final logger = Logger(
      printer: PrettyPrinter(
    methodCount: 0,
    errorMethodCount: 5,
    lineLength: 50,
    colors: true,
    printEmojis: true,
    printTime: false,
  ));
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      IconButton(
        iconSize: 40,
        onPressed: () {
          FirebaseAuth.instance.signOut().then((onValue) => {
                logger.d('DESLOGADO:'),
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const IdiomPage()),
                )
              });
        },
        icon: const Icon(Icons.logout),
      ),
    ]);
  }
}
