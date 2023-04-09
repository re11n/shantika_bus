import 'package:flutter/material.dart';

class PaymentPage extends StatefulWidget {
  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  String _cardNumber = "";
  String _expirationDate = "";
  String _cvvCode = "";
  bool _isCvvFocused = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                labelText: "Card Number",
              ),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                setState(() {
                  _cardNumber = value;
                });
              },
            ),
            SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: "Expiration Date",
                    ),
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      setState(() {
                        _expirationDate = value;
                      });
                    },
                  ),
                ),
                SizedBox(width: 20.0),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: "CVV Code",
                    ),
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      setState(() {
                        _cvvCode = value;
                      });
                    },
                    focusNode: FocusNode(),
                    obscureText: true,
                    onTap: () {
                      setState(() {
                        _isCvvFocused = true;
                      });
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
