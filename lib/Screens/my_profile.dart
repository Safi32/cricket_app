import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cricket_app/Screens/auth_screen/login.dart';
import 'package:cricket_app/widgets/drawer.dart';
import 'package:cricket_app/widgets/tickets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

final _firebase = FirebaseAuth.instance;

class UserProfile extends StatefulWidget {
  static const routeName = "userProfile";
  UserProfile({super.key});

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  var user = null;
  List _users = [];

  @override
  void initState() {
    _getUserData();
    super.initState();
  }

  void _getUserData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final id = await prefs.getString('id');
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection('acoounts').get();

    _users = querySnapshot.docs.map((doc) {
      return doc.data() as Map<String, dynamic>;
    }).toList();
    print(_users);

    user = _users.firstWhere((element) {
      return element["UserId"] == id;
    });
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: Text(
                  user != null ? user!["username"] : "",
                ),
              ),
              onSelected: (String value) async {
                if (value == 'My Profile') {
                  // Handle My Profile action
                } else if (value == 'Tickets') {
                  Navigator.pushNamed(context, TicketsScreen.routeName);
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
                  value: 'Shop',
                  child: ListTile(
                    leading: Icon(Icons.card_travel, color: Colors.black),
                    title: Text('Shop'),
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
      body: Column(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 4.9,
          ),
          Stack(
            alignment: Alignment.topCenter,
            clipBehavior: Clip.none,
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 1.5,
                decoration: const BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
              ),
              const Positioned(
                top: -50,
                child: CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.black,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
