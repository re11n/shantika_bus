import 'package:flutter/material.dart';

class JadwalPage extends StatelessWidget {

const JadwalPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor:Color.fromRGBO(197,202,233, 1),
       appBar: AppBar(
        backgroundColor: Color.fromRGBO(6,175,115, 1),
      ),
      body: SafeArea (
        child: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 40,
              ),

              const Text('Mau Lihat Jadwal Kemana?',
              style: TextStyle(
                fontFamily: 'Acme-Regular',
                fontSize: 40,
                fontWeight: FontWeight.w400,
              ),
              ),
              const SizedBox(
                height: 40,
              ),

              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 32),
                    child: Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                          ),
                          width: 150,
                          height: 150,
                        )
                      ],
                    ),
                  ),
                  
                  Padding(
                    padding: const EdgeInsets.only(left: 40),
                    child: Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                          ),
                          width: 150,
                          height: 150,
                        )
                      ],
                    ),
                  ),
                ],
              ),

              const SizedBox(
                height: 40,
              ),

              Row(
                children: [
                  Padding(
                        padding: const EdgeInsets.only(left: 32),
                        child: Stack(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                              ),
                              width: 150,
                              height: 150,
                            )
                          ],
                        ),
                      ),

                  Padding(
                        padding: const EdgeInsets.only(left: 40),
                        child: Stack(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                              ),
                              width: 150,
                              height: 150,
                            )
                          ],
                        ),
                      ),
                ],
              ),

              const SizedBox(
                height: 40,
              ),
              
              Row(
                children: [
                  Padding(
                            padding: const EdgeInsets.only(left: 32),
                            child: Stack(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                  ),
                                  width: 150,
                                  height: 150,
                                )
                              ],
                            ),
                          ),

                  Padding(
                        padding: const EdgeInsets.only(left: 40),
                        child: Stack(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                              ),
                              width: 150,
                              height: 150,
                            )
                          ],
                        ),
                      ),
                ],
              ),

              const SizedBox(
                height: 40,
              ),

              Padding(
                        padding: const EdgeInsets.only(left: 0),
                        child: Stack(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                color: Colors.white,
                              ),
                              width: 400,
                              height: 100,
                            ),
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 25, left: 25),
                                  child: Container(
                                    decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(80),
                                    color: Colors.green,
                                  ),
                                  width: 120,
                                  height: 50,
                                  ),
                                ),
                              ]
                            )
                          ],
                        ),
                      ),
            ],
          ))),
    );
  }
}