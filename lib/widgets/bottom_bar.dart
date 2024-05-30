import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cricket_app/Screens/blogs_screen.dart';
import 'package:cricket_app/Screens/events_screen.dart';
import 'package:cricket_app/Screens/home_screen.dart';
import 'package:cricket_app/Screens/my_profile.dart';
import 'package:cricket_app/utils/colors.dart';
import 'package:cricket_app/widgets/shop.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({Key? key}) : super(key: key);

  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _selectedIndex = 0;
  var user;
  List _users = [];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    _getUserData();
  }

  void _getUserData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final id = prefs.getString('id');
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection('acoounts').get();

    _users = querySnapshot.docs.map((doc) {
      return doc.data() as Map<String, dynamic>;
    }).toList();

    user = _users.firstWhere((element) {
      return element["UserId"] == id;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_business),
            label: 'Shop',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.web_asset),
            label: 'Events',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.web_outlined),
            label: 'Blogs',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: primaryColor,
        onTap: _onItemTapped,
      ),
      body: _selectedIndex == 0
          ? HomeScreen()
          : _selectedIndex == 1
              ? const ShopScreen()
              : _selectedIndex == 2
                  ? const EventsScreen()
                  : _selectedIndex == 3
                      ? const BlogsScreen()
                      : _selectedIndex == 4
                          ? UserProfile(user)
                          : const SizedBox(),
    );
  }
}
