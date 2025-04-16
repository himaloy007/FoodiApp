import 'package:dynamic_app/items.dart';
import 'package:dynamic_app/pages/offer_show_page.dart';
import 'package:dynamic_app/pages/search_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.red.shade700,
        toolbarHeight: 100,
        flexibleSpace: Padding(
          padding: const EdgeInsets.only(left: 15, right: 10),
          child: Column(
            children: [
              const SizedBox(height: 30),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      "Deliver to",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(54, 238, 235, 235),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Icon(Icons.notifications, color: Colors.white),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 40,
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => SearchPage(),
                                  ),
                                );
                              },
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.search,
                                    color: Colors.grey.shade700,
                                  ),
                                  const SizedBox(width: 5),
                                  Text(
                                    "Search for restaurants...",
                                    style: TextStyle(
                                      color: Colors.grey.shade700,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              Container(
                                height: 40,
                                width: 1,
                                color: Colors.red,
                              ),
                              const SizedBox(width: 10),
                              Icon(Icons.mic, color: Colors.red),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Container(
                      padding: EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: const Color.fromARGB(42, 255, 255, 255),
                      ),
                      child: Icon(Icons.tune, color: Colors.grey.shade100),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: SizedBox(
                    height: 250,
                    width: double.infinity,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: Items().images.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder:
                                    (context) => OfferShowPage(
                                      imagePath: Items().images[index],
                                    ),
                              ),
                            );
                          },
                          child: Container(
                            padding: EdgeInsets.only(right: 10, left: 10),
                            margin: EdgeInsets.only(right: 10),
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(12),
                            ),

                            child: Image.asset(Items().images[index]),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  height: 250,
                  child: Row(
                    children: [
                      Column(
                        children: [
                          Container(
                            height: 130,
                            width: 180,
                            padding: EdgeInsets.all(10),

                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: const Color.fromARGB(141, 76, 175, 79),
                            ),

                            child: Column(
                              children: [
                                Expanded(
                                  child: Text(
                                    "Food Delivery",
                                    style: TextStyle(fontSize: 17),
                                  ),
                                ),
                                Image.asset(
                                  'cuisines/pizzza.png',
                                  height: 69,
                                  width: 69,
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 5),
                          Expanded(
                            child: Container(
                              width: 180,
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: const Color.fromARGB(148, 255, 235, 59),
                              ),
                              child: Column(
                                children: [
                                  Text(
                                    "Pick-Up",
                                    style: TextStyle(fontSize: 17),
                                  ),
                                  Image.asset(
                                    'cuisines/pick.png',
                                    height: 60,
                                    width: 70,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(width: 5),
                      Expanded(
                        child: Column(
                          children: [
                            Container(
                              width: double.infinity,
                              height: 100,
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: const Color.fromARGB(139, 244, 67, 54),
                              ),
                              child: Column(
                                children: [
                                  Text(
                                    "Dine-in",
                                    style: TextStyle(fontSize: 17),
                                  ),
                                  Image.asset(
                                    'cuisines/dinein.png',
                                    height: 50,
                                    width: 60,
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 5),
                            Expanded(
                              child: Container(
                                height: 200,
                                width: double.infinity,
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: const Color.fromARGB(
                                    139,
                                    155,
                                    39,
                                    176,
                                  ),
                                ),
                                child: Column(
                                  children: [
                                    Text(
                                      "Flowers",
                                      style: TextStyle(fontSize: 17),
                                    ),
                                    const SizedBox(height: 10),
                                    Image.asset(
                                      'cuisines/flower.png',
                                      height: 70,
                                      width: 70,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),

                //popular cuisines
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Popular Cuisine',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    Text(
                      'See All',
                      style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                SizedBox(
                  height: 150,
                  width: double.infinity,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: Items().cuisine.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Image.asset(
                              Items().cuisine[index][1],
                              height: 70,
                              width: 70,

                              fit: BoxFit.cover,
                            ),
                            Text(
                              Items().cuisine[index][0],
                              style: TextStyle(
                                fontWeight: FontWeight.w300,
                                fontSize: 10,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: 150,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: Items().offers.length,
                    itemBuilder: (context, index) {
                      return Container(
                        padding: EdgeInsets.all(5),
                        margin: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.grey.shade200,
                        ),
                        child: Image.asset(Items().offers[index]),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
