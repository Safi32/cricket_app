import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cricket_app/Screens/auth_screen/login.dart';
import 'package:cricket_app/utils/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

final _firebase = FirebaseAuth.instance;

class UserProfile extends StatefulWidget {
  static const routeName = "userProfile";

  final user;
  UserProfile(this.user);

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  var user;
  List _users = [];

  @override
  void initState() {
    _getUserData();
    user = widget.user;
    super.initState();
  }

  void _getUserData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final id = prefs.getString('id');
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection('accounts').get();

    _users = querySnapshot.docs.map((doc) {
      return doc.data() as Map<String, dynamic>;
    }).toList();

    setState(() {
      user = _users.firstWhere((element) {
        return element["UserId"] == id;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xFF68B787),
        title: const Text(
          'My Profile',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        actions: [
          PopupMenuButton<String>(
            onSelected: (String value) async {
              if (value == 'Logout') {
                try {
                  await _firebase.signOut();
                } catch (e) {
                  print("Error signing out: $e");
                }
                Navigator.pushReplacementNamed(context, LogInScreen.routeName);
              }
            },
            itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
              const PopupMenuItem<String>(
                value: 'Tickets',
                child: ListTile(
                  leading: Icon(Icons.event_note),
                  title: Text('Tickets'),
                ),
              ),
              const PopupMenuItem<String>(
                value: 'Shop',
                child: ListTile(
                  leading: Icon(Icons.shopping_cart),
                  title: Text('Shop'),
                ),
              ),
              const PopupMenuItem<String>(
                value: 'Logout',
                child: ListTile(
                  leading: Icon(Icons.logout),
                  title: Text('Logout'),
                ),
              ),
            ],
          ),
        ],
      ),
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    SizedBox(height: 20),
                    CircleAvatar(
                      radius: 50,
                      backgroundColor: primaryColor,
                      backgroundImage: NetworkImage(user?['photoUrl'] ?? ""),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  )),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Your Information',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  ListTile(
                    leading: const Icon(Icons.person),
                    title:
                        Text('Name: ${user != null ? user["username"] : ""}'),
                  ),
                  ListTile(
                    leading: const Icon(Icons.email),
                    title: Text('Email: ${user != null ? user["email"] : ""}'),
                  ),
                  ListTile(
                    leading: const Icon(Icons.phone),
                    title: Text('Phone: ${user != null ? user["phone"] : ""}'),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
