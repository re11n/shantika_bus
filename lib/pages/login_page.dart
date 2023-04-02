import 'package:flutter/material.dart';
import 'package:shantika_bus/conponents/login_textfield.dart';
import 'package:shantika_bus/conponents/login_button.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void signUserIn() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color.fromARGB(255, 197, 202, 233),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 20,
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
                          onTap: signUserIn,
                        ),
                      ),
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
    );
  }
}
