import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../components/dot_tiket.dart';
import '../components/pesan_form.dart';
import '../components/ticket_form.dart';
import '../components/tipe_harga_form.dart';

class JadwalPage extends StatefulWidget {
  const JadwalPage({super.key});

  @override
  State<JadwalPage> createState() => _JadwalPageState();
}

class _JadwalPageState extends State<JadwalPage> {
  final Stream<QuerySnapshot> _busStream =
      FirebaseFirestore.instance.collection('listbus').snapshots();

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
              const Padding(
                padding: EdgeInsets.only(top: 10, bottom: 10),
                child: Text(
                  'Mau lihat jadwal apa?',
                  style: TextStyle(
                    fontFamily: 'Acme-Regular',
                    fontSize: 35,
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(left: 5, right: 5, top: 8, bottom: 8),
                child: StreamBuilder<QuerySnapshot>(
                  stream: _busStream,
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
                              child: TicketForm(
                                asal: data['asal'],
                                tujuan: data['tujuan'],
                                kodeasal: data['kodeasal'],
                                kodetujuan: data['kodetujuan'],
                                durasi: data['durasi'],
                                jamberangkat: data['jamberangkat'],
                                jamsampai: data['jamsampai'],
                                tanggal: data['tanggal'],
                                no: data['no'],
                              ),
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const PesanForm(),
                                    ));
                              },
                            ),
                            const DotTiket(),
                            TipeHargaForm(
                                harga: data['harga'], tipebus: data['tipebus'])
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
