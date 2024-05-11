import 'package:cricket_app/utils/colors.dart';
import 'package:cricket_app/widgets/matches.dart';
import 'package:cricket_app/widgets/previous_matches.dart';
import 'package:flutter/material.dart';

class PageTwoScreen extends StatefulWidget {
  const PageTwoScreen({super.key});

  @override
  State<PageTwoScreen> createState() => _PageTwoScreenState();
}

class _PageTwoScreenState extends State<PageTwoScreen> {
  @override
  Widget build(BuildContext context) {
    bool showMatchesScreen = true;
    return Container(
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
                        color: showMatchesScreen ? primaryColor : Colors.white,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Center(
                        child: Text(
                          "Upcoming",
                          style: TextStyle(
                            color:
                                showMatchesScreen ? Colors.white : Colors.black,
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
                        color: showMatchesScreen ? Colors.white : primaryColor,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Center(
                        child: Text(
                          "Previous",
                          style: TextStyle(
                            color:
                                showMatchesScreen ? Colors.black : Colors.white,
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
    );
  }
}
