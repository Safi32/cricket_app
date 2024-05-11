import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cricket_app/Screens/auth_screen/login.dart';
import 'package:cricket_app/Screens/page_view/page_01.dart';
import 'package:cricket_app/utils/colors.dart';
import 'package:cricket_app/widgets/drawer.dart';
import 'package:cricket_app/widgets/matches.dart';
import 'package:cricket_app/widgets/previous_matches.dart';
import 'package:cricket_app/widgets/slider.dart';
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
  bool showMatchesScreen = true;
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
              child: StreamBuilder(
                stream:
                    FirebaseFirestore.instance.collection('users').snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Center(
                          child: Text(snapshot.error.toString()),
                        ),
                      ],
                    );
                  }
                  if (snapshot.hasData) {
                    final userData = snapshot.data!.docs;
                    List<String> usernames = [];
                    for (var userDoc in userData) {
                      final userName = userDoc.data()['_userName'];
                      usernames.add(userName);
                    }
                    return Expanded(
                      child: ListView(
                        children: usernames
                            .map((userName) => Text(userName))
                            .toList(),
                      ),
                    );
                  }
                  return const CircularProgressIndicator.adaptive();
                },
              ),
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
          Container(
            decoration: const BoxDecoration(
              color: backgroundColor,
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 30),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              showMatchesScreen = true;
                            });
                          },
                          child: Container(
                            height: 35,
                            width: 100,
                            decoration: BoxDecoration(
                              color: showMatchesScreen
                                  ? primaryColor
                                  : Colors.white,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Center(
                              child: Text(
                                "Upcoming",
                                style: TextStyle(
                                  color: showMatchesScreen
                                      ? Colors.white
                                      : Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              showMatchesScreen = false;
                            });
                          },
                          child: Container(
                            height: 35,
                            width: 100,
                            decoration: BoxDecoration(
                              color: showMatchesScreen
                                  ? Colors.white
                                  : primaryColor,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Center(
                              child: Text(
                                "Previous",
                                style: TextStyle(
                                  color: showMatchesScreen
                                      ? Colors.black
                                      : Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                if (showMatchesScreen)
                  const Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          MatchesScreen(
                            image: "assets/shirt.png",
                            dateTime: "9 April 2024, 8:00 AM",
                            clubName: "Defenders Cricket Club",
                            teams: "Gunner vs Stars",
                          ),
                          MatchesScreen(
                            image: "assets/shirt.png",
                            dateTime: "9 April 2024, 8:00 AM",
                            clubName: "Defenders Cricket Club",
                            teams: "Gunner vs Stars",
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          MatchesScreen(
                            image: "assets/shirt.png",
                            dateTime: "9 April 2024, 8:00 AM",
                            clubName: "Defenders Cricket Club",
                            teams: "Gunner vs Stars",
                          ),
                          MatchesScreen(
                            image: "assets/shirt.png",
                            dateTime: "9 April 2024, 8:00 AM",
                            clubName: "Defenders Cricket Club",
                            teams: "Gunner vs Stars",
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          MatchesScreen(
                            image: "assets/shirt.png",
                            dateTime: "9 April 2024, 8:00 AM",
                            clubName: "Defenders Cricket Club",
                            teams: "Gunner vs Stars",
                          ),
                          MatchesScreen(
                            image: "assets/shirt.png",
                            dateTime: "9 April 2024, 8:00 AM",
                            clubName: "Defenders Cricket Club",
                            teams: "Gunner vs Stars",
                          ),
                        ],
                      ),
                    ],
                  )
                else
                  const Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          PreviousMatchesScreen(
                            image: "assets/shirt.png",
                            dateTime: "9 April 2024 , 9:00 AM",
                            clubName: "Defenders Cricket Club",
                            teams: "Gunners vs Stars",
                          ),
                          PreviousMatchesScreen(
                            image: "assets/shirt.png",
                            dateTime: "9 April 2024 , 9:00 AM",
                            clubName: "Defenders Cricket Club",
                            teams: "Gunners vs Stars",
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          PreviousMatchesScreen(
                            image: "assets/shirt.png",
                            dateTime: "9 April 2024 , 9:00 AM",
                            clubName: "Defenders Cricket Club",
                            teams: "Gunners vs Stars",
                          ),
                          PreviousMatchesScreen(
                            image: "assets/shirt.png",
                            dateTime: "9 April 2024 , 9:00 AM",
                            clubName: "Defenders Cricket Club",
                            teams: "Gunners vs Stars",
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          PreviousMatchesScreen(
                            image: "assets/shirt.png",
                            dateTime: "9 April 2024 , 9:00 AM",
                            clubName: "Defenders Cricket Club",
                            teams: "Gunners vs Stars",
                          ),
                          PreviousMatchesScreen(
                            image: "assets/shirt.png",
                            dateTime: "9 April 2024 , 9:00 AM",
                            clubName: "Defenders Cricket Club",
                            teams: "Gunners vs Stars",
                          ),
                        ],
                      ),
                    ],
                  ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Container(
                        height: 35,
                        width: 100,
                        decoration: BoxDecoration(
                          color: primaryColor,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: const Center(
                          child: Text(
                            "Check more",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 20,
                    horizontal: 5,
                  ),
                  child: SizedBox(
                    height: 370,
                    width: double.infinity,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: const [
                        SliderScreen(
                          image: "assets/kits.png",
                          title: "Latest about Cricclub",
                          description:
                              "There are many different sports \n clubs available, so it is important to \n do some research",
                          btnText: "Read More",
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        SliderScreen(
                          image: "assets/team2.png",
                          title: "Latest about Cricclub",
                          description:
                              "There are many different sports \n clubs available, so it is important to \n do some research",
                          btnText: "Read More",
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        SliderScreen(
                          image: "assets/article-1.png",
                          title: "Latest about Cricclub",
                          description:
                              "There are many different sports \n clubs available, so it is important to \n do some research",
                          btnText: "Read More",
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 80,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Rate Us",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
