import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../pages/bottom_navbar.dart';
import '../controllers/select_seat_controller.dart';

class SelectSeatView extends GetView<SelectSeatController> {
  final String nobus;
  final String nama;
  final String harga;
  final String gender;
  final String jenisbus;

  SelectSeatView(this.nobus, this.nama, this.harga, this.gender, this.jenisbus,
      {super.key});
  var kursis = "";

  final CollectionReference _users =
      FirebaseFirestore.instance.collection('bookings');

  var currentUser = FirebaseAuth.instance.currentUser?.email;
  var transaksi = "${Random().nextInt(999999) + 10000}";

  void submitBooking(var nobus1, var nama1, var harga1, var kursipilih,
      var jkel, var curUser) async {
    try {
      await _users.doc(transaksi).set({
        "notransaksi": transaksi,
        "nobus": nobus1,
        "nama": nama1,
        "harga": harga1,
        "kursi": kursipilih,
        "gender": jkel,
        "email": curUser,
        "dibayar": "false"
      });
    } on FirebaseAuthException catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    SelectSeatController controller = Get.put(SelectSeatController());
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 197, 202, 233),
        body: Stack(
          children: [
            Container(
              width: Get.width,
              height: Get.height,
            ),
            Column(
              children: [
                SizedBox(height: context.mediaQueryPadding.top),
                Container(
                  height: 100,
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        'Pilih Kursi',
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF333e63)),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          const Text(
                            'New Shantika',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF333e63)),
                          ),
                          Text(
                            jenisbus,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Container(
                  height: 40,
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Status(
                        stat: 'Available',
                        color: Colors.white,
                      ),
                      Status(
                        stat: 'Filled',
                        color: Color.fromARGB(255, 162, 162, 158),
                      ),
                      Status(
                        stat: 'Selected',
                        color: Colors.green,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.5),
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(25),
                          topRight: Radius.circular(25),
                        )),
                    child: Column(
                      children: [
                        const SizedBox(height: 30),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: const [
                              Text(
                                'A',
                                style: TextStyle(
                                    fontSize: 17.5,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                'B',
                                style: TextStyle(
                                    fontSize: 17.5,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                'C',
                                style: TextStyle(
                                    fontSize: 17.5,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                'D',
                                style: TextStyle(
                                    fontSize: 17.5,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 25),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    child: Obx(
                                      () => GridView.builder(
                                        padding: const EdgeInsets.all(10),
                                        gridDelegate:
                                            const SliverGridDelegateWithFixedCrossAxisCount(
                                          mainAxisSpacing: 14,
                                          crossAxisSpacing: 16,
                                          crossAxisCount: 4,
                                        ),
                                        itemCount: controller
                                            .bus[controller.indexBus.value]
                                            .length,
                                        itemBuilder: (context, index) =>
                                            GestureDetector(
                                          onTap: () => kursis =
                                              controller.selectKursi(index),
                                          child: Container(
                                            width: 50,
                                            height: 50,
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                color: Colors.black38,
                                              ),
                                              color: controller.bus[controller
                                                              .indexBus.value]
                                                          [index]["stat"] ==
                                                      "Available"
                                                  ? Colors.white
                                                  : controller.bus[controller
                                                                  .indexBus
                                                                  .value][index]
                                                              ["stat"] ==
                                                          "Filled"
                                                      ? const Color.fromARGB(
                                                          255, 162, 162, 158)
                                                      : Colors.green,
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 100,
                  color: Colors.white.withOpacity(0.5),
                  child: Center(
                    child: ElevatedButton(
                      onPressed: () {
                        submitBooking(
                            nobus, nama, harga, kursis, gender, currentUser);
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: const Text('Pesan Tiket Berhasil'),
                                content: const Text(
                                    'Silahkan Ke Menu Payment Untuk Melakukan Pembayaran'),
                                actions: <Widget>[
                                  TextButton(
                                    child: const Text('Ok'),
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const Dashboard(),
                                        ),
                                      );
                                    },
                                  ),
                                ],
                              );
                            });
                      },
                      child: const Text("PESAN"),
                      style: ElevatedButton.styleFrom(
                        primary: const Color(0xFF656CEE),
                        fixedSize: Size(Get.width * 0.8, 50),
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ));
  }
}

class Status extends StatelessWidget {
  const Status({
    Key? key,
    required this.stat,
    required this.color,
  }) : super(key: key);

  final String stat;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 25,
          width: 25,
          decoration: BoxDecoration(
              color: color, borderRadius: BorderRadius.circular(5)),
        ),
        const SizedBox(width: 7),
        Text(
          stat,
          style: const TextStyle(
            fontSize: 18,
          ),
        )
      ],
    );
  }
}
