import 'package:cricket_app/Screens/auth_screen/login.dart';
import 'package:cricket_app/utils/colors.dart';
import 'package:cricket_app/widgets/drawer.dart';
import 'package:cricket_app/widgets/matches.dart';
import 'package:cricket_app/widgets/previous_matches.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

final _firebase = FirebaseAuth.instance;

class HomeScreen extends StatefulWidget {
  static const routeName = "homeScreen";
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
              icon: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Icon(
                  Icons.person,
                  color: Colors.white,
                ),
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
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Stack(
              children: [
                Positioned(
                  left: 0,
                  top: 0,
                  child: SizedBox(
                    width: 400,
                    child: Image.asset(
                      "assets/Header-Ellipse.png",
                    ),
                  ),
                ),
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset("assets/shirt.png"),
                      const SizedBox(height: 10),
                      const Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 20,
                            ),
                            child: Text(
                              "Defender Cricket Club",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          "A sports club is an organization of people interested in a particular sport or physical activity. clubs maybe dedicated to a single sport or to several multi multi-sport clubs.",
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20,
                            ),
                            child: Container(
                              height: 40,
                              width: 140,
                              decoration: BoxDecoration(
                                color: const Color(0xFF68B787),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: const Center(
                                child: Text(
                                  "Buy Tickets",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Positioned(
                  right: 0,
                  left: 0,
                  top: 100,
                  child: Image.asset(
                    "assets/Header-Ellipse-2.png",
                  ),
                ),
              ],
            ),
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
        ],
      ),
    );
  }
}
