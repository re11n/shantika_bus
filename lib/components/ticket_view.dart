import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shantika_bus/components/pesan_form.dart';
import 'package:shantika_bus/components/ticket_form.dart';
import 'package:shantika_bus/components/tipe_harga_form.dart';
import 'dot_tiket.dart';
import 'dart:async';

class TicketView extends StatefulWidget {
  const TicketView({super.key});

  @override
  State<TicketView> createState() => _TicketViewState();
}

class _TicketViewState extends State<TicketView> {
  final Stream<QuerySnapshot> _busStream =
      FirebaseFirestore.instance.collection('listbus').snapshots();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
      child: SingleChildScrollView(
          child: StreamBuilder<QuerySnapshot>(
        stream: _busStream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
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
            children: snapshot.data!.docs.map((DocumentSnapshot document) {
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
                  TipeHargaForm(harga: data['harga'], tipebus: data['tipebus'])
                ],
              );
            }).toList(),
          );
        },
      )),
    );
  }
}
