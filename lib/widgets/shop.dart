import 'package:cricket_app/utils/colors.dart';
import 'package:cricket_app/widgets/kits.dart';
import 'package:flutter/material.dart';

class ShopScreen extends StatelessWidget {
  static const routeName = "Shop";
  const ShopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                const Image(
                  image: AssetImage("assets/team.png"),
                  fit: BoxFit.cover,
                  height: 250,
                  width: double.infinity,
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 190),
                    child: Container(
                      height: 150,
                      width: 320,
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
                                Column(
                                  children: [
                                    const Text(
                                      "Premium Quality \nCricket Gloves",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontStyle: FontStyle.italic,
                                        fontSize: 16,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 30,
                                    ),
                                    Container(
                                      height: 40,
                                      width: 120,
                                      decoration: BoxDecoration(
                                        color: Colors.black,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: const Center(
                                        child: Text(
                                          "Shop Now",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Stack(
                                  clipBehavior: Clip.none,
                                  children: [
                                    Container(
                                      width: 120,
                                      height: 120,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Image.asset(
                                        "assets/Gloves.png",
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                    Positioned(
                                      left: -20,
                                      child: Container(
                                        padding: const EdgeInsets.all(5),
                                        decoration: BoxDecoration(
                                          color: Colors.black,
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                        child: const Text(
                                          "50% \nOFF",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 12,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
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
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 30,
                vertical: 20,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Kits",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                  Text(
                    "View all",
                    style: TextStyle(
                      color: primaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 25),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    KitScreen(
                      image: "assets/kit1.png",
                      title: "H-Sleeves Shirt",
                      price: "20\$",
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    KitScreen(
                      image: "assets/kit2.png",
                      title: "H-Sleeves Shirt",
                      price: "20\$",
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    KitScreen(
                      image: "assets/kit3.png",
                      title: "H-Sleeves Shirt",
                      price: "20\$",
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    KitScreen(
                      image: "assets/kit4.png",
                      title: "H-Sleeves Shirt",
                      price: "20\$",
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    KitScreen(
                      image: "assets/kit5.png",
                      title: "H-Sleeves Shirt",
                      price: "20\$",
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    KitScreen(
                      image: "assets/kit6.png",
                      title: "H-Sleeves Shirt",
                      price: "20\$",
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),
            const Padding(
              padding: EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 25,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Accessories",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "View all",
                    style: TextStyle(
                      color: primaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 25),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    KitScreen(
                      image: "assets/black-gloves.png",
                      title: "Batting Gloves",
                      price: "20\$",
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    KitScreen(
                      image: "assets/black-gloves.png",
                      title: "Batting Gloves",
                      price: "20\$",
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    KitScreen(
                      image: "assets/black-gloves.png",
                      title: "Batting Gloves",
                      price: "20\$",
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    KitScreen(
                      image: "assets/black-gloves.png",
                      title: "Batting Gloves",
                      price: "20\$",
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    KitScreen(
                      image: "assets/black-gloves.png",
                      title: "Batting Gloves",
                      price: "20\$",
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    KitScreen(
                      image: "assets/black-gloves.png",
                      title: "Batting Gloves",
                      price: "20\$",
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
