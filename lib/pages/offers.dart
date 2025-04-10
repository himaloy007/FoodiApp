import 'package:dynamic_app/Materials/container.dart';
import 'package:dynamic_app/items.dart';
import 'package:flutter/material.dart';

class OfferPage extends StatelessWidget {
  OfferPage({super.key});

  final items = Items().offerItem;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text('Offers', style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            return MyContainerBox(
              foodImage: items[index][0],
              logo: items[index][1],
              restaurant: items[index][2],
              rating: items[index][3],
              itemName: items[index][5],
              distance: items[index][4],
              deliveryfee: items[index][6],
              deliveryTime: items[index][7],
            );
          },
        ),
      ),
    );
  }
}
