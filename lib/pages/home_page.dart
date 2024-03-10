import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:trinitw/pages/sos_page.dart';
import 'package:trinitw/pages/updates_page.dart';

import '../resources/values/strings.dart';
import 'community_page.dart';
import 'funding_page.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Widget> pages = const [SOSPage(), UpdatesPage(), FundingPage(), CommunityPage()];
  int pageIndex = 0;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
        centerTitle: true,
        title: const Text(Strings.home),
      ),
      body: pages[pageIndex],
      bottomNavigationBar: CurvedNavigationBar(
        animationCurve: Curves.easeOut,
        animationDuration: const Duration(milliseconds: 250),
        backgroundColor: Colors.transparent,
        height: 65.0,
        items: const <Widget>[
          Icon(Icons.home, size: 30),
          Icon(Icons.notifications_active, size: 30),
          Icon(Icons.account_balance, size: 30),
          Icon(Icons.group, size: 30),
        ],
        onTap: (index) {
          setState(() {
            pageIndex = index;
          });
        },
      ),
      drawer: Drawer(
        backgroundColor: Theme.of(context).colorScheme.background,
        child: ElevatedButton(
          onPressed: FirebaseAuth.instance.signOut,
          child: const Text('Log-out'),
        ),
      ),
    );
  }
}
