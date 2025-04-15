import 'package:dynamic_app/Materials/cart_items.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RestaurantPage extends StatefulWidget {
  final String foodImage;
  final String logo;
  final String restaurant;
  final String rating;
  final String itemName;
  final String distance;
  final String deliveryfee;
  final String deliveryTime;
  const RestaurantPage({
    super.key,
    required this.foodImage,
    required this.logo,
    required this.restaurant,
    required this.rating,
    required this.itemName,
    required this.distance,
    required this.deliveryfee,
    required this.deliveryTime,
  });

  @override
  State<RestaurantPage> createState() => _RestaurantPageState();
}

class _RestaurantPageState extends State<RestaurantPage> {
  IconData favorites = Icons.favorite_border;

  bool fav = false;
  String snackBar = 'Added to favorites';

  void toggleFavorite() {
    setState(() {
      fav = !fav;
      favorites = fav ? Icons.favorite : Icons.favorite_border;
      snackBar = fav ? 'Added to favorites' : 'Removed from favorites';
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: const Color.fromARGB(255, 244, 67, 54),
          ),
          child: Text(
            snackBar,
            textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.white, fontSize: 16),
          ),
        ),
        duration: Duration(seconds: 1),
        backgroundColor: const Color.fromARGB(255, 244, 67, 54),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        margin: EdgeInsets.all(16),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final cartItem = Provider.of<CartItem>(context);
    final cartList = cartItem.cartItem[widget.restaurant] ?? [];
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                SizedBox(
                  height: 300,
                  width: double.infinity,
                  child: Image.asset(widget.foodImage, fit: BoxFit.cover),
                ),
                Positioned(
                  top: 50,
                  left: 0,
                  right: 0,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: BackButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            color: Colors.red, // Optional: set color
                          ),
                        ),
                        Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.share_outlined,
                                  color: Colors.red,
                                ),
                              ),
                            ),
                            const SizedBox(width: 16),
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: IconButton(
                                onPressed: toggleFavorite,
                                icon: Icon(favorites, color: Colors.red),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  bottom: -25,
                  right: 16,
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    height: 70,
                    width: 80,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.black, width: 2),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: ClipOval(child: Image.asset(widget.logo)),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Text(
                    widget.restaurant,
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  Row(
                    children: [
                      Icon(Icons.timelapse, color: Colors.red),
                      const SizedBox(width: 5),
                      Text('Delivery ${widget.deliveryfee} min'),
                    ],
                  ),
                  SizedBox(width: 5),
                  Row(
                    children: [
                      Icon(Icons.location_on, color: Colors.red),
                      Text('${widget.distance} away'),
                    ],
                  ),
                  Spacer(),
                  Text(
                    'More Info',
                    style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                children: [
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.red, size: 18),
                      const SizedBox(width: 3),
                      Text(widget.rating),
                    ],
                  ),
                  SizedBox(width: 15),

                  Text(
                    'Review',
                    style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 15, top: 20),
                  child: Row(
                    children: [
                      Text(
                        "Most Popular🔥",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                GridView.builder(
                  padding: const EdgeInsets.all(10),
                  shrinkWrap:
                      true, // Ensures the GridView takes only as much space as needed
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, // 2 columns
                    crossAxisSpacing: 10, // Spacing between columns
                    mainAxisSpacing: 10, // Spacing between rows
                    childAspectRatio:
                        1, // Adjust the aspect ratio to make rectangles
                  ),
                  itemCount: cartList.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Expanded(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Stack(
                              clipBehavior: Clip.none,
                              children: [
                                Positioned.fill(
                                  child: Image.asset(
                                    cartList[index][0],
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Positioned(
                                  bottom: 0,
                                  right: 0,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.red,
                                      borderRadius: BorderRadius.only(
                                        bottomRight: Radius.circular(10),
                                        topLeft: Radius.circular(10),
                                      ),
                                    ),
                                    child: IconButton(
                                      onPressed: () {
                                        cartItem.addToCart(cartList[index]);
                                        ScaffoldMessenger.of(
                                          context,
                                        ).showSnackBar(
                                          SnackBar(
                                            content: Text(
                                              "${cartList[index][1]} added to cart",
                                              textAlign: TextAlign.center,
                                              style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 16,
                                              ),
                                            ),
                                            duration: const Duration(
                                              seconds: 1,
                                            ),
                                            backgroundColor:
                                                const Color.fromARGB(
                                                  255,
                                                  244,
                                                  67,
                                                  54,
                                                ),
                                            behavior: SnackBarBehavior.floating,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30),
                                            ),
                                            margin: const EdgeInsets.all(16),
                                          ),
                                        );
                                      },
                                      icon: Icon(
                                        Icons.add,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 5),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    cartList[index][1],
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ), // Item name
                                  Text("from Taka ${cartList[index][2]}"),
                                ],
                              ),
                            ],
                          ),
                        ), // Item price
                      ],
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
