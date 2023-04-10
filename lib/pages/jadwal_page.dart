import 'dart:convert';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../components/dot_tiket.dart';
import '../components/ticket_form.dart';
import '../components/tipe_harga_form.dart';

class JadwalPage extends StatefulWidget {
  const JadwalPage({super.key});

  @override
  State<JadwalPage> createState() => _JadwalPageState();
}

class _JadwalPageState extends State<JadwalPage> {
  List tiketList = [];

  Future<void> readJson() async {
    final String response =
        await rootBundle.loadString('lib/assets/listbus.json');
    final data = await json.decode(response);
    setState(() {
      tiketList = data;
    });
  }

  @override
  void initState() {
    super.initState();
    readJson();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(197, 202, 233, 1),
      body: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10, top: 8, bottom: 8),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
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
                child: SingleChildScrollView(
                  child: Column(
                    children: tiketList.map((e) {
                      return Column(
                        children: [
                          const SizedBox(
                            height: 20,
                          ),
                          TicketForm(
                            asal: e['asal'],
                            tujuan: e['tujuan'],
                            kodeasal: e['kodeasal'],
                            kodetujuan: e['kodetujuan'],
                            durasi: e['durasi'],
                            jamberangkat: e['jamberangkat'],
                            jamsampai: e['jamsampai'],
                            tanggal: e['tanggal'],
                            no: e['no'],
                          ),
                          const DotTiket(),
                          TipeHargaForm(
                              harga: e['harga'], tipebus: e['tipebus'])
                        ],
                      );
                    }).toList(),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
