import 'package:cricket_app/utils/colors.dart';
import 'package:cricket_app/widgets/upcoming/previous_event.dart';
import 'package:flutter/material.dart';

class EventsScreen extends StatefulWidget {
  static const routeName = "events";
  const EventsScreen({super.key});

  @override
  State<EventsScreen> createState() => _EventsScreenState();
}

class _EventsScreenState extends State<EventsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: Column(
        children: [
          Stack(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 3.5,
                child: const Image(
                  image: AssetImage(
                    "assets/team.png",
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 170,
                  left: 30,
                ),
                child: Center(
                  child: Container(
                    height: 150,
                    width: 300,
                    decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              const Column(
                                children: [
                                  Text(
                                    "Best Performance in\nlast month",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontStyle: FontStyle.italic,
                                      fontSize: 16,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        " Saim Ayub's no-look\n shot has gained global \n fame recently",
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Stack(
                                clipBehavior: Clip.none,
                                children: [
                                  Container(
                                    width: 120,
                                    height: 120,
                                    child: Image.asset(
                                      "assets/nolook.png",
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          const Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 10,
                    ),
                    child: Text(
                      "Up Coming Events",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: Row(
                  children: [
                    UpcomingPrevious(),
                    SizedBox(
                      width: 10,
                    ),
                    UpcomingPrevious(),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: Row(
              children: [
                Text(
                  "Passed Events",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: Row(
              children: [
                UpcomingPrevious(),
                SizedBox(
                  width: 10,
                ),
                UpcomingPrevious(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
