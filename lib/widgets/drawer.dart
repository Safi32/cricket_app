import 'package:flutter/material.dart';

class DrawerScreen extends StatelessWidget {
  const DrawerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
          children: const [
            ListTile(
              title: Text(
                "Events",
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
            ListTile(
              title: Text(
                "Blogs",
                style: TextStyle(
                  color: Colors.black,
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
