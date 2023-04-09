import 'package:flutter/material.dart';
import 'package:shantika_bus/conponents/ticket_form.dart';
import 'package:shantika_bus/conponents/tipe_harga_form.dart';
import 'dot_tiket.dart';

class TicketView extends StatelessWidget {
  const TicketView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: const <Widget>[
            TicketForm(
              asal: 'Bandung',
              tujuan: 'Jakarta',
              durasi: '2H 30M',
              kodeasal: 'BDG',
              kodetujuan: 'JKT',
              jamberangkat: '08:00 AM',
              jamsampai: '02:30 PM',
              no: '23',
              tanggal: '1 Mei 2020',
            ),
            DotTiket(),
            TipeHargaForm(
              harga: 'RP 80.000',
              tipebus: 'Shantika Airbus',
            ),
          ],
        ),
      ),
    );
  }
}
