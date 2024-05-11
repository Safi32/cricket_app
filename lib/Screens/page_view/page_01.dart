import 'package:flutter/material.dart';

class PageOneScreen extends StatelessWidget {
  const PageOneScreen(
      {super.key,
      required this.image,
      required this.kitImage,
      required this.clubName,
      required this.description,
      required this.btnContainer,
      required this.image2});

  final String image;
  final String kitImage;
  final String clubName;
  final String description;
  final String btnContainer;
  final String image2;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Stack(
        children: [
          Positioned(
            left: 0,
            top: 0,
            child: SizedBox(
              width: 400,
              child: Image.asset(
                image,
              ),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  kitImage,
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 20,
                      ),
                      child: Text(
                        clubName,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    description,
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                      ),
                      child: Container(
                        height: 40,
                        width: 140,
                        decoration: BoxDecoration(
                          color: const Color(0xFF68B787),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Text(
                            btnContainer,
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            right: 0,
            left: 0,
            top: 100,
            child: Image.asset(
              image2,
            ),
          ),
        ],
      ),
    );
  }
}
