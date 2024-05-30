import 'package:cricket_app/Screens/blogs_screen.dart';
import 'package:cricket_app/Screens/events_screen.dart';
import 'package:cricket_app/Screens/my_profile.dart';
import 'package:cricket_app/utils/colors.dart';
import 'package:cricket_app/widgets/shop.dart';
import 'package:flutter/material.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({Key? key}) : super(key: key);

  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    switch (index) {
      case 0:
        Navigator.pushReplacementNamed(context, '/home');
        break;
      case 1:
        Navigator.pushReplacementNamed(context, ShopScreen.routeName);
        break;
      case 2:
        Navigator.pushReplacementNamed(context, EventsScreen.routeName);
        break;
      case 3:
        Navigator.pushReplacementNamed(context, BlogsScreen.routeName);
        break;
      case 4:
        Navigator.pushReplacementNamed(context, UserProfile.routeName);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
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
    );
  }
}
