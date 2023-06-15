import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shantika_bus/components/customshapeclipper.dart';
import 'package:shantika_bus/components/search_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  String greetingMessage() {
    var hour = DateTime.now().hour;
    String greeting;
    String emoji;
    String username = "";

    if (hour < 12) {
      greeting = "Selamat Pagi";
      emoji = "☀️";
    } else if (hour < 17) {
      greeting = "Selamat Siang";
      emoji = "🌞";
    } else if (hour < 20) {
      greeting = "Selamat Sore";
      emoji = "🌇";
    } else {
      greeting = "Selamat Malam";
      emoji = "🌙";
    }

    FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser?.email)
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      username = documentSnapshot.get("username");
      // ignore: avoid_print
      print(username);
    });

    return "$greeting$username $emoji";
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      ClipPath(
        clipper: CustomShapeClipper(),
        child: Container(
          height: 350,
          width: 400,
          color: const Color.fromRGBO(63, 81, 181, 1),
          child: Column(children: <Widget>[
            const SizedBox(
              height: 50.0,
            ),
            Text(
              greetingMessage(),
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24.0,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
            SearchBar()
          ]),
        ),
      )
    ]);
  }
}
