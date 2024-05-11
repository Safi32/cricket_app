import 'package:cricket_app/utils/colors.dart';
import 'package:flutter/material.dart';

class TeamsScreen extends StatelessWidget {
  static const routeName = "teamsScreen";
  const TeamsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        actions: const [
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 10,
            ),
            child: Text(
              "9 April 2024, 8:00 Am",
            ),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 40,
            ),
            child: Column(
              children: [
                Text(
                  "Gunners vs Stars",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  "Defender Cricket Club",
                  style: TextStyle(
                    fontSize: 13,
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 450,
                width: 180,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: Colors.black,
                  ),
                ),
                child: const Column(
                  children: [
                    Center(
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: Column(
                          children: [
                            Text(
                              "Team Gunners",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                            ),
                            Divider(
                              color: Colors.black,
                              thickness: 1.0,
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 450,
                width: 180,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: Colors.black,
                  ),
                ),
                child: const Column(
                  children: [
                    Center(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 10,
                        ),
                        child: Column(
                          children: [
                            Text(
                              "Team Stars",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                            ),
                            Divider(
                              color: Colors.black,
                              thickness: 1.0,
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 20,
            ),
            child: Container(
              height: 35,
              width: 120,
              decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.circular(5),
              ),
              child: const Center(
                child: Text(
                  "Buy Tickets",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
