import 'package:cricket_app/utils/colors.dart';
import 'package:cricket_app/widgets/tickets.dart';
import 'package:flutter/material.dart';

class UpcomingPrevious extends StatelessWidget {
  const UpcomingPrevious({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: 180,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 5,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image(
                  image: AssetImage("assets/shirt.png"),
                  height: 30,
                ),
                Padding(
                  padding: EdgeInsets.only(
                    right: 10,
                  ),
                  child: Text(
                    "9 April 2024, 8:00 AM",
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 10,
            ),
            child: Row(
              children: [
                Text(
                  "Defender Cricket Club",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 5,
            ),
            child: Row(
              children: [
                Text(
                  "Gunners Vs Stars",
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
            ),
            child: Row(
              children: [
                Container(
                  height: 40,
                  width: 120,
                  decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, TicketsScreen.routeName);
                      },
                      child: Text(
                        "Buy Tickets",
                        style: TextStyle(color: Colors.white, fontSize: 17),
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
