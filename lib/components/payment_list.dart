import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shantika_bus/pages/pembayaran.dart';
import 'package:intl/intl.dart';

class PaymentList extends StatefulWidget {
  const PaymentList({super.key});

  @override
  State<PaymentList> createState() => _PaymentListState();
}

class _PaymentListState extends State<PaymentList> {
  static String? currentUser = FirebaseAuth.instance.currentUser?.email;
  var formatter = NumberFormat("#,###");

  final Stream<QuerySnapshot> _bookings = FirebaseFirestore.instance
      .collection('bookings')
      .where("email", isEqualTo: currentUser)
      .where("dibayar", isEqualTo: "false")
      .snapshots();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(197, 202, 233, 1),
      body: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10, top: 8, bottom: 8),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              // const Padding(
              //   padding: EdgeInsets.only(top: 10, bottom: 10),
              //   child: Text(
              //     'Mau lihat jadwal apa?',
              //     style: TextStyle(
              //       fontFamily: 'Acme-Regular',
              //       fontSize: 35,
              //     ),
              //   ),
              // ),
              Padding(
                padding:
                    const EdgeInsets.only(left: 5, right: 5, top: 8, bottom: 8),
                child: StreamBuilder<QuerySnapshot>(
                  stream: _bookings,
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (snapshot.hasError) {
                      return const Text('Something went wrong');
                    }

                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Text("Loading");
                    }

                    return ListView(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      children:
                          snapshot.data!.docs.map((DocumentSnapshot document) {
                        Map<String, dynamic> data =
                            document.data()! as Map<String, dynamic>;
                        return Column(
                          children: [
                            const SizedBox(
                              height: 20,
                            ),
                            InkWell(
                              child: Card(
                                child: Padding(
                                  padding: EdgeInsets.all(10),
                                  child: ListTile(
                                    title: Text(
                                      data["nama"],
                                      style: TextStyle(
                                        fontSize: 20,
                                      ),
                                    ),
                                    leading: CircleAvatar(
                                      child: Text(
                                        data["nama"][0],
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    trailing: Text(
                                        "\Rp ${formatter.format(int.parse(data["harga"]))}"),
                                  ),
                                ),
                              ),
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => PaymentPage(
                                        kodebayar: data["notransaksi"],
                                        harga: data["harga"],
                                        nokursi: data["kursi"],
                                        nama: data["nama"],
                                      ),
                                    ));
                              },
                            ),
                          ],
                        );
                      }).toList(),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
