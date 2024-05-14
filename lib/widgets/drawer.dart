import 'package:cricket_app/Screens/blogs_screen.dart';
import 'package:cricket_app/Screens/events_screen.dart';
import 'package:flutter/material.dart';

class DrawerScreen extends StatelessWidget {
  const DrawerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          ListTile(
            title: InkWell(
              child: Container(
                child: Text(
                  "Home",
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ),
          ListTile(
            title: InkWell(
              onTap: () {
                Navigator.pushNamed(context, EventsScreen.routeName);
              },
              child: Text(
                "Events",
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
          ),
          ListTile(
            title: InkWell(
              onTap: () {
                Navigator.pushNamed(context, BlogsScreen.routeName);
              },
              child: Text(
                "Blogs",
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
          ),
          ListTile(
            title: Text(
              "About us",
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ),
          ListTile(
            title: Text(
              "Contact us",
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ),
          ListTile(
            title: Text(
              "Privacy policy",
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
