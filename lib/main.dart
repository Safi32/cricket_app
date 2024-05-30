import 'package:cricket_app/Screens/auth_screen/login.dart';
import 'package:cricket_app/Screens/auth_screen/signUp.dart';
import 'package:cricket_app/Screens/blogs_screen.dart';
import 'package:cricket_app/Screens/events_screen.dart';
import 'package:cricket_app/Screens/home_screen.dart';
import 'package:cricket_app/Screens/my_profile.dart';
import 'package:cricket_app/Screens/splash_screen.dart';
import 'package:cricket_app/Screens/teams_screen/teams_screen.dart';
import 'package:cricket_app/widgets/shop.dart';
import 'package:cricket_app/widgets/tickets.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
      home: SplashScreen(),
      routes: {
        '/home': (context) => HomeScreen(),
        '/login': (context) => const LogInScreen(),
        SignUpScreen.routeName: (context) => const SignUpScreen(),
        TeamsScreen.routeName: (context) => const TeamsScreen(),
        EventsScreen.routeName: (context) => const EventsScreen(),
        BlogsScreen.routeName: (context) => const BlogsScreen(),
        TicketsScreen.routeName: (context) => const TicketsScreen(),
        UserProfile.routeName: (context) => UserProfile(User),
        ShopScreen.routeName: (context) => const ShopScreen(),
      },
    );
  }
}
