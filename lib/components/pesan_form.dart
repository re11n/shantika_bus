import 'package:flutter/material.dart';

import '../pages/kursi_page.dart';

class PesanForm extends StatefulWidget {
  PesanForm({Key? key}) : super(key: key);

  @override
  State<PesanForm> createState() => _PesanFormState();
}

class _PesanFormState extends State<PesanForm> {
  String selectedValue = "lakilaki";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Pesan Tiket'),
          leading: BackButton(
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
                        const SizedBox(
                          height: 30,
                        ),
                        Text('Nama Penumpang: '),
                        const SizedBox(
                          height: 30,
                        ),
                        Text('No Telp: '),
                        const SizedBox(
                          height: 50,
                        ),
                        Text('Jenis Kelamin: '),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 40.0),
                    child: Column(
                      children: [
                        SizedBox(
                          width: 200,
                          child: TextField(
                            style: const TextStyle(
                                color: Color.fromARGB(255, 0, 0, 0)),
                            decoration: InputDecoration(
                              enabledBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color.fromARGB(255, 21, 48, 170))),
                              focusedBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black)),
                              hintText: 'no',
                              hintStyle: const TextStyle(
                                  color: Color.fromARGB(87, 255, 255, 255)),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 200,
                          child: TextField(
                            style: const TextStyle(
                                color: Color.fromARGB(255, 0, 0, 0)),
                            decoration: InputDecoration(
                              enabledBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color.fromARGB(255, 21, 48, 170))),
                              focusedBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black)),
                              hintText: 'nama',
                              hintStyle: const TextStyle(
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
                            items: dropdownItems)
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              TextButton(
                style: TextButton.styleFrom(backgroundColor: Color(0xffF18265)),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SelectSeat(),
                    ),
                  );
                },
                child: Text(
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
    DropdownMenuItem(child: Text("Laki - Laki"), value: "lakilaki"),
    DropdownMenuItem(child: Text("Perempuan"), value: "perempuan"),
  ];
  return menuItems;
}
