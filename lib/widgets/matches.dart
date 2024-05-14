import 'package:cricket_app/Screens/teams_screen/teams_screen.dart';
import 'package:cricket_app/utils/colors.dart';
import 'package:flutter/material.dart';

class MatchesScreen extends StatelessWidget {
  const MatchesScreen({
    super.key,
    required this.image,
    required this.dateTime,
    required this.clubName,
    required this.teams,
  });

  final String image;
  final String dateTime;
  final String clubName;
  final String teams;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      width: 200,
      decoration: BoxDecoration(
        color: const Color(0xFF9C9C9C),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 5,
        ),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  image,
                  height: 30,
                  width: 50,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 5,
                  ),
                  child: Text(
                    dateTime,
                    style: const TextStyle(
                      color: Color(
                        0xFFFFFFFF,
                      ),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                  ),
                  child: Text(
                    clubName,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
              ),
              child: Row(
                children: [
                  Text(
                    teams,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 7,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
              ),
              child: Row(
                children: [
                  Container(
                    height: 35,
                    width: 100,
                    decoration: const BoxDecoration(
                      color: primaryColor,
                    ),
                    child: Center(
                      child: InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, TeamsScreen.routeName);
                        },
                        child: const Text(
                          "More info",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
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
    );
  }
}
