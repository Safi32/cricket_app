import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class FetchData extends StatefulWidget {
  const FetchData({Key? key}) : super(key: key);

  @override
  State<FetchData> createState() => _FetchDataState();
}

class _FetchDataState extends State<FetchData> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }

  Future<void> getdata() async {
    try {
      DataSnapshot snapshot = (await FirebaseDatabase.instance
          .reference()
          .child("users")
          .once()) as DataSnapshot;

      // Access user data from snapshot
      Map<dynamic, dynamic>? userData = snapshot.value as Map?;

      // Process userData as needed

      // Example: printing userData
      print(userData);
    } catch (error) {
      // Handle error
      print("Error: $error");
    }
  }

  @override
  void initState() {
    super.initState();
    // Call the getdata method when the widget is initialized
    getdata();
  }
}
