import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shantika_bus/components/login_textfield.dart';
import 'package:shantika_bus/components/login_button.dart';

class LoginPage extends StatefulWidget {
  final Function()? onTap;

  const LoginPage({super.key, required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  void signUserIn() async {
    showDialog(
        context: context,
        builder: (context) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        });

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      if (e.code == 'user-not-found') {
        wrongEmailMessage();
      } else if (e.code == 'wrong-password') {
        wrongPasswordMessage();
      }
    }
  }

  void wrongEmailMessage() {
    showDialog(
      context: context,
      builder: (context) {
        return const AlertDialog(
          title: Text('Email tidak ditemukan'),
        );
      },
    );
  }

  void wrongPasswordMessage() {
    showDialog(
      context: context,
      builder: (context) {
        return const AlertDialog(
          title: Text('Password salah'),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 197, 202, 233),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 5,
                ),

                // logo new shantika
                Image.asset(
                  'lib/images/shantika_logo.png',
                  height: 200,
                  width: 200,
                ),

                const Text(
                  'New Shantika',
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Hurricane',
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    shadows: [
                      Shadow(
                        blurRadius: 10.0,
                        color: Colors.black,
                        offset: Offset(1.0, 1.0),
                      ),
                    ],
                  ),
                ),

                const Text(
                  'Mobile App',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    shadows: [
                      Shadow(
                        blurRadius: 10.0,
                        color: Colors.black,
                        offset: Offset(1.0, 1.0),
                      ),
                    ],
                  ),
                ),

                const SizedBox(
                  height: 25,
                ),

                Stack(
                  alignment: Alignment.topCenter,
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: const Color.fromARGB(255, 63, 81, 181),
                      ),
                      width: 300,
                      height: 400,
                    ),
                    Column(
                      children: [
                        // form email
                        Padding(
                          padding: const EdgeInsets.only(top: 30),
                          child: LoginTextField(
                            controller: emailController,
                            hintText: 'Email',
                            obscureText: false,
                          ),
                        ),

                        //form password
                        Padding(
                          padding: const EdgeInsets.only(top: 30),
                          child: LoginTextField(
                            controller: passwordController,
                            hintText: 'Password',
                            obscureText: true,
                          ),
                        ),

                        //lupa password
                        Padding(
                          padding: const EdgeInsets.only(right: 65, top: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: const [
                              Text(
                                'Lupa password?',
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        ),

                        //tombol login
                        Padding(
                          padding: const EdgeInsets.only(top: 30),
                          child: LoginButton(
                            text: "Login",
                            onTap: signUserIn,
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.only(top: 80.0, left: 75),
                          child: Row(
                            children: [
                              const Text(
                                'Belum punya akun?',
                                style: TextStyle(color: Colors.black),
                              ),
                              const SizedBox(
                                width: 4,
                              ),
                              GestureDetector(
                                onTap: widget.onTap,
                                child: const Text(
                                  'Register Sekarang',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ],
                ),

                const SizedBox(
                  height: 25,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
