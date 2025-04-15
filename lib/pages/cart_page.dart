import 'package:dynamic_app/Materials/cart_items.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(242, 255, 255, 255),
      appBar: AppBar(
        centerTitle: true,
        title: Text('CartPage', style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      body: Consumer<CartItem>(
        builder: (context, cartItem, child) {
          return ListView.builder(
            itemCount: cartItem.cartItemList.length,
            itemBuilder: (context, index) {
              return Container(
                padding: EdgeInsets.all(8),
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ListTile(
                  leading: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(cartItem.cartItemList[index][0]),
                  ),
                  title: Text(cartItem.cartItemList[index][1]),
                  subtitle: Text('Price: ${cartItem.cartItemList[index][2]}'),
                  trailing: Column(
                    children: [
                      IconButton(
                        icon: Icon(Icons.delete, color: Colors.red),
                        onPressed: () {
                          cartItem.removeFromCart(index);
                        },
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
