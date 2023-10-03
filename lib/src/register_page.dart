import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'home_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final nomeController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmController = TextEditingController();
  final genderController = TextEditingController();
  final wheredYouMeetUs = TextEditingController();
  bool _isLoading = false;
  bool _passwordVisible = false;
  bool _confirmPasswordVisible = false;

  String genderValue = 'Masculino';
  final List<String> genders = <String>['Masculino', 'Feminino', 'Outros'];

  void createAccount() async {
    setState(() => _isLoading = true);

    //@TODO - Adicionar modal para tratar quando não existir usuário ou senha inválida
    await FirebaseAuth.instance
        .createUserWithEmailAndPassword(
            email: emailController.text, password: passwordController.text)
        .then((value) => {
              setState(() => _isLoading = false),
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const HomePage()),
              )
            })
        .catchError((error) => {
              setState(() => _isLoading = false),
              debugPrint('Dados do ERRO AO Criar Conta: $error')
            });
  }

  @override
  Widget build(BuildContext context) {
    final bottom = MediaQuery.of(context).viewInsets.bottom;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xffECD2C0),
      appBar: AppBar(
        backgroundColor: const Color(0xffECD2C0),
        iconTheme: const IconThemeData(
          color: Color(0xff6F2D48), //change your color here
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(bottom: bottom),
        reverse: true,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(
              left: 21,
              right: 21,
            ),
            child: Column(
              children: [
                Image.asset('assets/images/mini-eye.png'),
                TextField(
                  controller: nomeController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    labelText: 'Seu nome',
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    labelText: 'Email',
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                TextField(
                  obscureText:
                      !_passwordVisible, //This will obscure text dynamically
                  controller: passwordController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    labelText: 'Senha',
                    suffixIcon: IconButton(
                      icon: Icon(
                        // Based on passwordVisible state choose the icon
                        _passwordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: const Color(0xff6F2D48),
                      ),
                      onPressed: () {
                        // Update the state i.e. toogle the state of passwordVisible variable
                        setState(() {
                          _passwordVisible = !_passwordVisible;
                        });
                      },
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                TextField(
                  obscureText: !_confirmPasswordVisible,
                  controller: confirmController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    labelText: 'Confirme a senha',
                    suffixIcon: IconButton(
                      icon: Icon(
                        // Based on passwordVisible state choose the icon
                        _confirmPasswordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: const Color(0xff6F2D48),
                      ),
                      onPressed: () {
                        // Update the state i.e. toogle the state of passwordVisible variable
                        setState(() {
                          _confirmPasswordVisible = !_confirmPasswordVisible;
                        });
                      },
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                TextField(
                  controller: wheredYouMeetUs,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    labelText: 'Como nos conheceu?',
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  height: 60,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.rectangle,
                    border: Border.all(
                      width: 1,
                      color: const Color(0xff6F2D48),
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: DropdownButton(
                        // Initial Value
                        value: genderValue,

                        // Down Arrow Icon
                        icon: const Icon(Icons.keyboard_arrow_down),

                        // Array list of items
                        items: genders.map((String items) {
                          return DropdownMenuItem(
                            value: items,
                            child: Text(items),
                          );
                        }).toList(),
                        // After selecting the desired option,it will
                        // change button value to selected value
                        onChanged: (String? newValue) {
                          setState(() {
                            genderValue = newValue!;
                          });
                        },
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    backgroundColor:
                        _isLoading ? Colors.grey : const Color(0xff6F2D48),
                    minimumSize: const Size.fromHeight(50), // NEW
                  ),
                  onPressed: _isLoading
                      ? null
                      : () {
                          createAccount();
                        },
                  child: Text(
                    _isLoading ? 'Carregando...' : 'Criar',
                    style: const TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
