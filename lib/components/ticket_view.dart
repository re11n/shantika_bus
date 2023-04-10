import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shantika_bus/components/pesan_form.dart';
import 'package:shantika_bus/components/ticket_form.dart';
import 'package:shantika_bus/components/tipe_harga_form.dart';
import 'dot_tiket.dart';
import 'dart:async';
import 'dart:convert';

class TicketView extends StatefulWidget {
  const TicketView({super.key});

  @override
  State<TicketView> createState() => _TicketViewState();
}

class _TicketViewState extends State<TicketView> {
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
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
      child: SingleChildScrollView(
        child: Column(
          children: tiketList.map((e) {
            return Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                InkWell(
                  child: TicketForm(
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
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PesanForm(),
                      ),
                    );
                  },
                ),
                const DotTiket(),
                TipeHargaForm(harga: e['harga'], tipebus: e['tipebus'])
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
