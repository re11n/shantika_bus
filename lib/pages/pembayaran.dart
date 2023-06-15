import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'bottom_navbar.dart';

class PaymentPage extends StatefulWidget {
  final String kodebayar;
  final String harga;
  final String nokursi;
  final String nama;
  const PaymentPage(
      {super.key,
      required this.kodebayar,
      required this.harga,
      required this.nokursi,
      required this.nama});

  @override
  // ignore: library_private_types_in_public_api
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
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

  void _processPayment() {
    booking.doc(widget.kodebayar).update({'dibayar': 'true'});
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Pembayaran Berhasil !'),
        actions: [
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const Dashboard(),
                ),
              );
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Pembayaran")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Kode Bayar : ${widget.kodebayar} \nAtas Nama : ${widget.nama} \nNo Kursi : ${widget.nokursi}  \nTotal Harga : Rp ${formatter.format(int.parse(widget.harga))}',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 16.0),
              Text(
                'Nomor Dana',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              TextField(
                controller: _expiryDateController,
                keyboardType: TextInputType.datetime,
                decoration: const InputDecoration(
                  hintText: '08******',
                ),
              ),
              const SizedBox(height: 16.0),
              // Text(
              //   'Password',
              //   style: Theme.of(context).textTheme.titleLarge,
              // ),
              // TextField(
              //   obscureText: true,
              //   /* ... */
              //   controller: _cvvController,
              //   keyboardType: TextInputType.number,
              //   decoration: const InputDecoration(
              //     hintText: 'Enter Password',
              //   ),
              // ),
              const SizedBox(height: 32.0),
              Center(
                child: ElevatedButton(
                  onPressed: _processPayment,
                  child: const Text('Pay'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
