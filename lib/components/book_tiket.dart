import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../pages/kursi_page.dart';

class BookTiket extends StatefulWidget {
  final String nobus;
  final String harga;
  const BookTiket({
    Key? key,
    required this.nobus,
    required this.harga,
  }) : super(key: key);

  @override
  State<BookTiket> createState() => _BookTiketState();
}

class _BookTiketState extends State<BookTiket> {
  String selectedValue = "lakilaki";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Pesan Tiket'),
          leading: const BackButton(
            color: Colors.black,
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        SizedBox(
                          height: 30,
                        ),
                        Text('Nomor Bus: '),
                        SizedBox(
                          height: 30,
                        ),
                        Text('Nama Penumpang: '),
                        SizedBox(
                          height: 30,
                        ),
                        Text('No Telp: '),
                        SizedBox(
                          height: 50,
                        ),
                        Text('Jenis Kelamin: '),
                        SizedBox(
                          height: 50,
                        ),
                        Text("Harga: "),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 40.0),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 35,
                        ),
                        Text(widget.nobus),
                        const SizedBox(
                          width: 200,
                          child: TextField(
                            style:
                                TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                            decoration: InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color.fromARGB(255, 21, 48, 170))),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black)),
                              hintText: 'no',
                              hintStyle: TextStyle(
                                  color: Color.fromARGB(87, 255, 255, 255)),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 200,
                          child: TextField(
                            style:
                                TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                            decoration: InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color.fromARGB(255, 21, 48, 170))),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black)),
                              hintText: 'nama',
                              hintStyle: TextStyle(
                                  color: Color.fromARGB(87, 255, 255, 255)),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        DropdownButton(
                            value: selectedValue,
                            onChanged: (String? newValue) {
                              setState(() {
                                selectedValue = newValue!;
                              });
                            },
                            items: dropdownItems),
                        const SizedBox(
                          height: 30,
                        ),
                        Text(widget.harga),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              TextButton(
                style: TextButton.styleFrom(
                    backgroundColor: const Color(0xffF18265)),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      ///builder: (context) => const SelectSeat(),
                      builder: (context) => const SelectSeat(),
                    ),
                  );
                },
                child: const Text(
                  "Pilih Kursi",
                  style: TextStyle(
                    color: Color(0xffffffff),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}

List<DropdownMenuItem<String>> get dropdownItems {
  List<DropdownMenuItem<String>> menuItems = [
    const DropdownMenuItem(value: "lakilaki", child: Text("Laki - Laki")),
    const DropdownMenuItem(value: "perempuan", child: Text("Perempuan")),
  ];
  return menuItems;
}
