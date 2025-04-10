import 'package:flutter/material.dart';

class RestaurantPage extends StatelessWidget {
  final String imagePath;
  const RestaurantPage({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Image.asset(imagePath),
                  Positioned(
                    top: 8,
                    left: 0,
                    right: 0,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          BackButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            color: Colors.red, // Optional: set color
                          ),
                          Row(
                            children: [
                              Icon(Icons.share_outlined, color: Colors.red),
                              const SizedBox(width: 16),
                              Icon(Icons.favorite_border, color: Colors.red),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
