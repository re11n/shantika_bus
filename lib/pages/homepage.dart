import 'package:flutter/material.dart';
import 'package:shantika_bus/conponents/customshapeclipper.dart';
import 'package:shantika_bus/conponents/search_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      ClipPath(
        clipper: CustomShapeClipper(),
        child: Container(
          height: 350,
          width: 400,
          color: Color.fromRGBO(63, 81, 181, 1),
          child: Column(children: <Widget>[
            SizedBox(
              height: 50.0,
            ),
            Text(
              'Selamat Pagi User!',
              style: TextStyle(
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
