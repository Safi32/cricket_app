import 'package:cricket_app/Screens/home_screen.dart';
import 'package:cricket_app/utils/colors.dart';
import 'package:cricket_app/widgets/slider.dart';
import 'package:flutter/material.dart';

class BlogsScreen extends StatelessWidget {
  static const routeName = "blogsScreen";
  const BlogsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              const Image(
                image: AssetImage(
                  "assets/Pak_team.png",
                ),
              ),
              Positioned(
                top: 30,
                left: 30,
                child: IconButton(
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, HomeScreen.routeName);
                  },
                ),
              ),
              const Positioned(
                bottom: 100,
                left: 130,
                child: Text(
                  "Latest About PCT",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Positioned(
                bottom: 60,
                left: 155,
                child: Container(
                  height: 35,
                  width: 120,
                  decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: const Center(
                    child: Text(
                      "Read More",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 20,
                    horizontal: 5,
                  ),
                  child: SizedBox(
                    height: 350,
                    width: double.infinity,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: const [
                        SliderScreen(
                          image: "assets/kits.png",
                          title: "Latest about Cricclub",
                          description:
                              "There are many different sports \n clubs available, so it is important to \n do some research",
                          btnText: "Read More",
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        SliderScreen(
                          image: "assets/team2.png",
                          title: "Latest about Cricclub",
                          description:
                              "There are many different sports \n clubs available, so it is important to \n do some research",
                          btnText: "Read More",
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        SliderScreen(
                          image: "assets/article-1.png",
                          title: "Latest about Cricclub",
                          description:
                              "There are many different sports \n clubs available, so it is important to \n do some research",
                          btnText: "Read More",
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 60,
            width: double.infinity,
            color: const Color(0xFF242424),
            child: Center(
              child: Column(
                children: [
                  const Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 5,
                          horizontal: 20,
                        ),
                        child: Text(
                          'Follow us on',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15,
                    ),
                    child: Row(
                      children: [
                        Container(
                          height: 25,
                          child: const Image(
                            image: AssetImage(
                              "assets/camera.png",
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Container(
                          height: 25,
                          child: const Image(
                            image: AssetImage(
                              "assets/Facebook.png",
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Container(
                          height: 25,
                          child: const Image(
                            image: AssetImage(
                              "assets/YouTube.png",
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Container(
                          height: 25,
                          child: const Image(
                            image: AssetImage(
                              "assets/LinkedIn.png",
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
