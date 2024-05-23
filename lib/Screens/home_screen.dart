import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cricket_app/Screens/auth_screen/login.dart';
import 'package:cricket_app/utils/colors.dart';
import 'package:cricket_app/widgets/drawer.dart';
import 'package:cricket_app/widgets/page_view/page_01.dart';
import 'package:cricket_app/widgets/tickets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

final _firebase = FirebaseAuth.instance;

class HomeScreen extends StatefulWidget {
  static const routeName = '/home';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List _users = [];
  var user = null;
  @override
  void initState() {
    _getAllUsers();
    super.initState();
  }

  void _getAllUsers() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final id = await prefs.getString('id');
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection('acoounts').get();

    _users = querySnapshot.docs.map((doc) {
      return doc.data() as Map<String, dynamic>;
    }).toList();

    user = _users.firstWhere((element) {
      return element["UserId"] == id;
    });
    print(user);

    setState(() {});
  }

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
        children: const [
          PageOneScreen(
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
