import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shantika_bus/conponents/login_textfield.dart';
import 'package:shantika_bus/conponents/login_button.dart';

class RegisterPage extends StatefulWidget {
  final Function()? onTap;

  const RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  void signUserUp() async {
    showDialog(
        context: context,
        builder: (context) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        });

    try {
      if (passwordController.text == confirmPasswordController.text) {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: emailController.text, password: passwordController.text);
      } else {
        wrongConfirmMessage();
      }

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

  void wrongConfirmMessage() {
    showDialog(
      context: context,
      builder: (context) {
        return const AlertDialog(
          title: Text('Password tidak sama, tolong masukkan ulang'),
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
                  height: 150,
                  width: 150,
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

                        //form confirm password
                        Padding(
                          padding: const EdgeInsets.only(top: 30),
                          child: LoginTextField(
                            controller: confirmPasswordController,
                            hintText: 'Confirm Password',
                            obscureText: true,
                          ),
                        ),

                        //tombol login
                        Padding(
                          padding: const EdgeInsets.only(top: 30),
                          child: LoginButton(
                            text: "Register",
                            onTap: signUserUp,
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.only(top: 45.0, left: 75),
                          child: Row(
                            children: [
                              const Text(
                                'Sudah punya akun?',
                                style: TextStyle(color: Colors.black),
                              ),
                              const SizedBox(
                                width: 4,
                              ),
                              GestureDetector(
                                onTap: widget.onTap,
                                child: const Text(
                                  'Login Sekarang',
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
