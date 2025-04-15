import 'package:flutter/material.dart';

class CartItem extends ChangeNotifier {
  Map<String, dynamic> cartItem = {
    'Sultans Dine': [
      ['offerItems/kacchi.jpg', 'Basmati Kacchi', '300'],
      ['offerItems/handiBiriyani.jpg', 'Handi Biriyani', '500'],
      ['cuisines/biriayni.png', 'Chicken Biriyani', '200'],
      ['offerItems/Sultans Dine.jpg', 'Mutton Biriyani', '600'],
    ],
    'Kacchi Bhai': [
      ['offerItems/kacchi.jpg', 'Basmati Kacchi', '300'],
      ['offerItems/handiBiriyani.jpg', 'Handi Biriyani', '500'],
      ['cuisines/biriayni.png', 'Chicken Biriyani', '200'],
      ['offerItems/Sultans Dine.jpg', 'Mutton Biriyani', '600'],
    ],
    'Tasty Treat': [
      ['offerItems/kacchi.jpg', 'Basmati Kacchi', '300'],
      ['offerItems/handiBiriyani.jpg', 'Handi Biriyani', '500'],
      ['cuisines/biriayni.png', 'Chicken Biriyani', '200'],
      ['offerItems/Sultans Dine.jpg', 'Mutton Biriyani', '600'],
    ],
    'Chow-Mein': [
      ['offerItems/kacchi.jpg', 'Basmati Kacchi', '300'],
      ['offerItems/handiBiriyani.jpg', 'Handi Biriyani', '500'],
      ['cuisines/biriayni.png', 'Chicken Biriyani', '200'],
      ['offerItems/Sultans Dine.jpg', 'Mutton Biriyani', '600'],
    ],
    'Prawn Fry': [
      ['offerItems/kacchi.jpg', 'Basmati Kacchi', '300'],
      ['offerItems/handiBiriyani.jpg', 'Handi Biriyani', '500'],
      ['cuisines/biriayni.png', 'Chicken Biriyani', '200'],
      ['offerItems/Sultans Dine.jpg', 'Mutton Biriyani', '600'],
    ],
    'KFC': [
      ['offerItems/kacchi.jpg', 'Basmati Kacchi', '300'],
      ['offerItems/handiBiriyani.jpg', 'Handi Biriyani', '500'],
      ['cuisines/biriayni.png', 'Chicken Biriyani', '200'],
      ['offerItems/Sultans Dine.jpg', 'Mutton Biriyani', '600'],
    ],
    'Pizzaburg': [
      ['offerItems/kacchi.jpg', 'Basmati Kacchi', '300'],
      ['offerItems/handiBiriyani.jpg', 'Handi Biriyani', '500'],
      ['cuisines/biriayni.png', 'Chicken Biriyani', '200'],
      ['offerItems/Sultans Dine.jpg', 'Mutton Biriyani', '600'],
    ],
  };

  List<List<String>> cartItemList = [];

  void addToCart(List<String> item) {
    cartItemList.add(item);
    notifyListeners();
  }

  void removeFromCart(int index) {
    cartItemList.removeAt(index);
    notifyListeners();
  }

  void clearCart() {
    cartItemList.clear();
    notifyListeners();
  }
}
