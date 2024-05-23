import 'package:cricket_app/Screens/auth_screen/login.dart';
import 'package:cricket_app/Screens/auth_screen/signUp.dart';
import 'package:cricket_app/Screens/blogs_screen.dart';
import 'package:cricket_app/Screens/events_screen.dart';
import 'package:cricket_app/Screens/home_screen.dart';
import 'package:cricket_app/Screens/teams_screen/teams_screen.dart';
import 'package:cricket_app/widgets/tickets.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const LogInScreen(),
      routes: {
        HomeScreen.routeName: (context) => HomeScreen(),
        LogInScreen.routeName: (context) => const LogInScreen(),
        SignUpScreen.routeName: (context) => const SignUpScreen(),
        TeamsScreen.routeName: (context) => const TeamsScreen(),
        EventsScreen.routeName: (context) => const EventsScreen(),
        BlogsScreen.routeName: (context) => const BlogsScreen(),
        TicketsScreen.routeName: (context) => const TicketsScreen(),
      },
    );
  }
}
