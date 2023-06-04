// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

class TipeHargaForm extends StatelessWidget {
  final tipebus;
  final harga;

  const TipeHargaForm({
    super.key,
    required this.harga,
    required this.tipebus,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 12),
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(24),
              bottomRight: Radius.circular(24))),
      child: Row(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
                color: Colors.amber.shade50,
                borderRadius: BorderRadius.circular(20)),
            child: const Icon(Icons.directions_bus_filled, color: Colors.amber),
          ),
          const SizedBox(
            width: 16,
          ),
          Text(tipebus,
              style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey)),
          Expanded(
              child: Text(harga,
                  textAlign: TextAlign.end,
                  style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black))),
        ],
      ),
    );
  }
}
