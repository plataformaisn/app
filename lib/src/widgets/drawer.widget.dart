import 'package:flutter/material.dart';

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({super.key});

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  late bool _dropdownLanguageIsOpened = false;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        backgroundColor: const Color(0xff782749),
        child: Padding(
          padding: const EdgeInsets.only(top: 49),
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: [
              ListTile(
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RichText(
                      text: const TextSpan(
                          text: 'Olá,',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 26,
                              fontWeight: FontWeight.bold),
                          children: <TextSpan>[
                            TextSpan(
                              text: ' Alice',
                              style: TextStyle(
                                  color: Color(0xffD96F32),
                                  fontSize: 26,
                                  fontWeight: FontWeight.bold),
                            )
                          ]),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.menu,
                        size: 34.5,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                onTap: () {
                  // Update the state of the app.
                  // ...
                },
              ),
              ListTile(
                title: const Row(
                  children: [
                    Icon(
                      Icons.remove_red_eye_outlined,
                      color: Color(0xffD96F32),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Text(
                      'assine versão premium',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                onTap: () {
                  // Update the state of the app.
                  // ...
                },
              ),
              const Divider(
                color: Color(0xffF1D0BD),
                thickness: 2,
                indent: 20,
              ),
              ListTile(
                title: const Row(
                  children: [
                    Icon(
                      Icons.star,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Text(
                      'Avalie nosso app',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                onTap: () {
                  // Update the state of the app.
                  // ...
                },
              ),
              const Divider(
                color: Color(0xffF1D0BD),
                thickness: 2,
                indent: 20,
              ),
              ListTile(
                title: const Row(
                  children: [
                    Icon(
                      Icons.mail_outline,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Text(
                      'Entre em contato',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                onTap: () {
                  // Update the state of the app.
                  // ...
                },
              ),
              const Divider(
                color: Color(0xffF1D0BD),
                thickness: 2,
                indent: 20,
              ),
              ListTile(
                title: const Row(
                  children: [
                    Icon(
                      Icons.favorite,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Text(
                      'Favoritos',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                onTap: () {
                  // Update the state of the app.
                  // ...
                },
              ),
              const Divider(
                color: Color(0xffF1D0BD),
                thickness: 2,
                indent: 20,
              ),
              ListTile(
                title: const Row(
                  children: [
                    Icon(
                      Icons.language,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Idioma',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 135,
                        ),
                        Icon(
                          Icons.keyboard_arrow_down_sharp,
                          color: Colors.white,
                        )
                      ],
                    ),
                  ],
                ),
                onTap: () {
                  setState(() {
                    _dropdownLanguageIsOpened = !_dropdownLanguageIsOpened;
                  });
                },
              ),
              if (_dropdownLanguageIsOpened)
                SizedBox(
                  width: double.infinity,
                  child: Container(
                    decoration: const BoxDecoration(color: Color(0xff601f3a)),
                    child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding:
                                EdgeInsets.only(left: 55, top: 24, bottom: 14),
                            child: Text(
                              'espanhol',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Divider(
                            color: Color(0xffF1D0BD),
                            thickness: 1,
                          ),
                          Padding(
                            padding:
                                EdgeInsets.only(left: 55, top: 14, bottom: 14),
                            child: Text(
                              'inglês',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Divider(
                            color: Color(0xffF1D0BD),
                            thickness: 1,
                          ),
                          Padding(
                            padding:
                                EdgeInsets.only(left: 55, top: 14, bottom: 14),
                            child: Text(
                              'português[BR]',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Divider(
                            color: Color(0xffF1D0BD),
                            thickness: 1,
                          ),
                          Padding(
                            padding:
                                EdgeInsets.only(left: 55, top: 14, bottom: 24),
                            child: Text(
                              'português[PT]',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ]),
                  ),
                ),
              if (!_dropdownLanguageIsOpened)
                const Divider(
                  color: Color(0xffF1D0BD),
                  thickness: 2,
                  indent: 20,
                ),
              ListTile(
                title: const Row(
                  children: [
                    Icon(
                      Icons.abc,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Text(
                      'Seguir nas nossas redes',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                onTap: () {
                  // Update the state of the app.
                  // ...
                },
              ),
              const Divider(
                color: Color(0xffF1D0BD),
                thickness: 2,
                indent: 20,
              ),
              ListTile(
                title: const Row(
                  children: [
                    Icon(
                      Icons.logout,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Text(
                      'Logout',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                onTap: () {
                  // Update the state of the app.
                  // ...
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
