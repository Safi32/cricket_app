import 'package:flutter/material.dart';

class KitScreen extends StatelessWidget {
  const KitScreen(
      {super.key,
      required this.image,
      required this.title,
      required this.price});

  final String image;
  final String title;
  final String price;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: 150,
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 100,
            width: double.infinity,
            child: Image(
              image: AssetImage(
                image,
              ),
              fit: BoxFit.contain,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            price,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
