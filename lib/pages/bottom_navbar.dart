import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:shantika_bus/conponents/search_bar.dart';
import 'package:shantika_bus/conponents/ticket_view.dart';

class Dashboard extends StatefulWidget {
  Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final user = FirebaseAuth.instance.currentUser!;
  int _selectedIndex = 0;

  List<Widget> tabItems = [
    Column(children: [SearchBar(), TicketView()]),
    Center(child: Text("Ticket")),
    Center(child: Text("Payment")),
    Center(child: Text("Schedule")),
  ];
  void signUserOut() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(63, 81, 181, 1),
        ),
        body: Center(
          child: tabItems[_selectedIndex],
        ),
        bottomNavigationBar: FlashyTabBar(
          animationCurve: Curves.linear,
          selectedIndex: _selectedIndex,
          iconSize: 30,
          showElevation: false, // use this to remove appBar's elevation
          onItemSelected: (index) => setState(() {
            _selectedIndex = index;
          }),
          items: [
            FlashyTabBarItem(
              icon: Icon(Icons.house),
              title: Text('Dashboard'),
            ),
            FlashyTabBarItem(
              icon: Icon(Icons.airplane_ticket),
              title: Text('Ticket'),
            ),
            FlashyTabBarItem(
              icon: Icon(Icons.payment),
              title: Text('Payment'),
            ),
            FlashyTabBarItem(
              icon: Icon(Icons.schedule),
              title: Text('Schedule'),
            ),
          ],
        ),
      ),
    );
  }
}
