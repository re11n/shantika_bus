import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:shantika_bus/conponents/search_bar.dart';
import 'package:shantika_bus/conponents/ticket_view.dart';
import 'jadwal_page.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final user = FirebaseAuth.instance.currentUser!;
  int _selectedIndex = 0;

  List<Widget> tabItems = [
    Column(children: [SearchBar(), TicketView()]),
    const Center(child: Text("Payment")),
    const JadwalPage(),
    const Center(child: Text("About us")),
  ];
  void signUserOut() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: const Color.fromRGBO(63, 81, 181, 1),
          leading: Image.asset(
            'lib/images/shantika_logo.png',
          ),
          actions: [
            IconButton(onPressed: signUserOut, icon: const Icon(Icons.logout)),
          ],
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
              icon: const Icon(Icons.house),
              title: const Text('Dashboard'),
            ),
            FlashyTabBarItem(
              icon: const Icon(Icons.payment),
              title: const Text('Payment'),
            ),
            FlashyTabBarItem(
              icon: const Icon(Icons.schedule),
              title: const Text('Schedule'),
            ),
            FlashyTabBarItem(
              icon: const Icon(Icons.person_2_outlined),
              title: const Text('About Us'),
            ),
          ],
        ),
      ),
    );
  }
}
