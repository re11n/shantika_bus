import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'bottom_navbar.dart';

class TiketInfoPage extends StatefulWidget {
  final String kodebayar;
  final String harga;
  final String nokursi;
  final String nama;
  const TiketInfoPage(
      {super.key,
      required this.kodebayar,
      required this.harga,
      required this.nokursi,
      required this.nama});

  @override
  // ignore: library_private_types_in_public_api
  _TiketInfoPageState createState() => _TiketInfoPageState();
}

class _TiketInfoPageState extends State<TiketInfoPage> {
  final _cardNumberController = TextEditingController();
  final _expiryDateController = TextEditingController();
  final _cvvController = TextEditingController();
  var formatter = NumberFormat("#,###");

  @override
  void dispose() {
    _cardNumberController.dispose();
    _expiryDateController.dispose();
    _cvvController.dispose();
    super.dispose();
  }

  CollectionReference booking =
      FirebaseFirestore.instance.collection('bookings');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Detail Tiket")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'No Tiket : ${widget.kodebayar} \nAtas Nama : ${widget.nama} \nNo Kursi : ${widget.nokursi}  \nTotal Harga : Rp ${formatter.format(int.parse(widget.harga))}',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 16.0),
              Text(
                'QR CODE',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 60.0),
              Center(
                child: Image.asset(
                  'lib/images/qr-tiket.png',
                  height: 300,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
