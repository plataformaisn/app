import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../home_page.dart';
import '../login_page.dart';

class BottonmSheetLogin extends StatefulWidget {
  const BottonmSheetLogin({super.key});

  @override
  State<BottonmSheetLogin> createState() => _BottonmSheetLoginState();
}

class _BottonmSheetLoginState extends State<BottonmSheetLogin> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool _isLoading = false;
  bool _passwordVisible = false;

  @override
  void initState() {
    super.initState();
  }

  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  void makeLogin() async {
    setState(() => _isLoading = true);

    //@TODO - Adicionar modal para tratar quando não existir usuário ou senha inválida
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(
            email: emailController.text, password: passwordController.text)
        .then((value) => {
              logger.d('Salvando Usuário Profile:', value),
              setState(() => _isLoading = false),
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const HomePage()),
              )
            })
        .catchError((error) => {
              setState(() => _isLoading = false),
              debugPrint('Dados do ERRO AO LOGAR: $error'),
            });
  }

  Future _googleAuth() async {
    await signInWithGoogle().then((value) => {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const HomePage()),
          )
        });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 641,
      width: double.infinity,
      clipBehavior: Clip.antiAlias,
      decoration: const BoxDecoration(
        color: Color(0xffFFFFFF),
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(32.0), topRight: Radius.circular(32.0)),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 0, left: 24, right: 24, bottom: 21),
        child: Column(
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Stack(
                  children: [
                    Align(
                      alignment: const AlignmentDirectional(1.18, 150),
                      child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(
                          Icons.cancel_outlined,
                          color: Color(0xff782749),
                        ),
                      ),
                    ),
                  ],
                ),
                RichText(
                  text: const TextSpan(
                    text: 'já faz parte',
                    style: TextStyle(
                      color: Color(0xff782749),
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: '  do clube dos intensos?',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xffBF2C2C),
                            fontSize: 18),
                      ),
                    ],
                  ),
                ),
                const Text(
                  'Acesse sua conta',
                  style: TextStyle(
                    color: Color(0xff782749),
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              child: TextField(
                controller: emailController,
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.only(top: 20),
                  hintText: 'Email',
                  hintStyle: TextStyle(color: Color(0xffCED3DB)),
                  prefixIcon: Icon(
                    Icons.mail_outline,
                    color: Color(0xff782749),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(8),
                      topRight: Radius.circular(8),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              width: double.infinity,
              height: 5,
              color: const Color(0xff782749),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              child: TextField(
                obscureText:
                    !_passwordVisible, //This will obscure text dynamically
                controller: passwordController,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.only(top: 20),
                  hintText: 'Senha',
                  hintStyle: const TextStyle(color: Color(0xffCED3DB)),
                  prefixIcon: const Icon(
                    Icons.lock_outline,
                    color: Color(0xff782749),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  suffixIcon: IconButton(
                    icon: Icon(
                      // Based on passwordVisible state choose the icon
                      _passwordVisible
                          ? Icons.visibility_outlined
                          : Icons.visibility_off_outlined,
                      color: const Color(0xff6F2D48),
                    ),
                    onPressed: () {
                      // Update the state i.e. toogle the state of passwordVisible variable
                      setState(() {
                        _passwordVisible = !_passwordVisible;
                      });
                    },
                  ),
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(8),
                      topRight: Radius.circular(8),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              width: double.infinity,
              height: 5,
              color: const Color(0xff782749),
            ),
            TextButton(
              style: TextButton.styleFrom(
                textStyle: const TextStyle(
                  fontSize: 16,
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginPage()),
                );
              },
              child: const Align(
                alignment: Alignment.topRight,
                child: Text(
                  "esqueceu sua senha?",
                  style: TextStyle(
                      color: Color(0xff782749),
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline),
                ),
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xff6F2D48),
                minimumSize: const Size.fromHeight(56),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16)),
              ),
              onPressed: () => {},
              child: const Text(
                'Login',
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  color: const Color(0xff6F2D48),
                  height: 2,
                  width: 278,
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    color: Colors.white,
                    alignment: Alignment.center,
                    width: 35,
                    child: const Text(
                      'OU',
                      style: TextStyle(
                          color: Color(0xff6F2D48),
                          fontSize: 12,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 18,
            ),
            InkWell(
              onTap: () {
                _googleAuth();
              },
              child: Ink(
                color: Colors.white,
                child: Container(
                  width: double.infinity,
                  height: 48,
                  decoration: BoxDecoration(
                    border: Border.all(color: const Color(0xff6F2D48)),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset:
                            const Offset(0, 1), // changes position of shadow
                      ),
                    ],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                      padding: const EdgeInsets.all(6),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset('assets/images/gmail_logo.png'),
                          const SizedBox(
                            width: 15,
                          ),
                          const Text(
                            'Entrar com Gmail',
                            style: TextStyle(color: Colors.black),
                          ),
                        ],
                      )),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: () {},
              child: Ink(
                color: Colors.white,
                child: Container(
                  width: double.infinity,
                  height: 48,
                  decoration: BoxDecoration(
                    border: Border.all(color: const Color(0xff6F2D48)),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset:
                            const Offset(0, 1), // changes position of shadow
                      ),
                    ],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                      padding: const EdgeInsets.all(6),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset('assets/images/apple_logo.png'),
                          const SizedBox(
                            width: 15,
                          ),
                          const Text(
                            'Entrar com Apple',
                            style: TextStyle(color: Colors.black),
                          ),
                        ],
                      )),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: () {},
              child: Ink(
                color: Colors.white,
                child: Container(
                  width: double.infinity,
                  height: 48,
                  decoration: BoxDecoration(
                    border: Border.all(color: const Color(0xff6F2D48)),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset:
                            const Offset(0, 1), // changes position of shadow
                      ),
                    ],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                      padding: const EdgeInsets.all(6),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset('assets/images/facebook_logo.png'),
                          const SizedBox(
                            width: 15,
                          ),
                          const Text(
                            'Entrar com Facebook',
                            style: TextStyle(color: Colors.black),
                          ),
                        ],
                      )),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
