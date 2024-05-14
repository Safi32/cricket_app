import 'dart:async';

import 'package:cricket_app/Screens/auth_screen/login.dart';
import 'package:cricket_app/utils/colors.dart';
import 'package:cricket_app/widgets/drawer.dart';
import 'package:cricket_app/widgets/page_view/page_01.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

final _firebase = FirebaseAuth.instance;
String _userName = "";

class HomeScreen extends StatefulWidget {
  static const routeName = "homeScreen";
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    _getUserInfo();
  }

  Future<void> _getUserInfo() async {
    User? user = _firebase.currentUser;
    if (user != null) {
      setState(() {
        _userName = user.displayName ?? '';
      });
    }
  }

  bool toggle = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: AppBar(
          foregroundColor: Colors.white,
          backgroundColor: const Color(0xFF68B787),
          centerTitle: true,
          title: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 150,
                height: 150,
                child: Image.asset(
                  "assets/icon.png.png",
                ),
              ),
            ],
          ),
          actions: [
            PopupMenuButton<String>(
              onSelected: (String value) async {
                if (value == 'My Profile') {
                  // Handle My Profile action
                } else if (value == 'Tickets') {
                  // Handle Tickets action
                } else if (value == 'Logout') {
                  try {
                    await _firebase.signOut();
                  } catch (e) {
                    print("Error signing out: $e");
                  }
                  Navigator.pushReplacementNamed(
                      context, LogInScreen.routeName);
                }
              },
              itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                const PopupMenuItem<String>(
                  value: 'My Profile',
                  child: ListTile(
                    leading: Icon(Icons.account_circle, color: Colors.black),
                    title: Text('My Profile'),
                  ),
                ),
                const PopupMenuItem<String>(
                  value: 'Tickets',
                  child: ListTile(
                    leading: Icon(Icons.event_note, color: Colors.black),
                    title: Text('Tickets'),
                  ),
                ),
                const PopupMenuItem<String>(
                  value: 'Logout',
                  child: ListTile(
                    leading: Icon(Icons.logout, color: Colors.black),
                    title: Text('Logout'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      drawer: const DrawerScreen(),
      body: PageView(
        scrollDirection: Axis.vertical,
        children: [
          const PageOneScreen(
            image: "assets/Header-Ellipse.png",
            kitImage: "assets/shirt.png",
            clubName: "Defenders Cricket Club",
            description:
                "A sports club is an organization of people interested in a particular sport or physical activity. clubs maybe dedicated to a single sport or to several multi multi-sport clubs.",
            btnContainer: "Buy Tickets",
            image2: "assets/Header-Ellipse-2.png",
          ),
        ],
      ),
    );
  }
}
