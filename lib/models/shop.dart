import 'package:flutter/cupertino.dart';
import 'package:minimal_ecom_app/models/product.dart';

class Shop extends ChangeNotifier{
  // product for sale

  final List<Product> _shop = [
    Product(
      name: 'Product 1',
      price: 90.32,
      description: 'Item 1',
      imagePath: 'assets/shoes1.jpeg',
    ),

    Product(
      name: 'Product 2',
      price: 10.00,
      description: 'Item 2',
      imagePath: 'assets/shoes2.jpeg',
    ),

    Product(
      name: 'Product 3',
      price: 78.31,
      description: 'Item 3',
      imagePath: 'assets/shoes3.jpeg',
    ),

    Product(
      name: 'Product 4',
      price: 20.28,
      description: 'Item 4',
      imagePath: 'assets/shoes4.jpeg',
    ),
  ];

  // user cart

  List<Product> _cart = [];


  // get product list

  List<Product> get shop => _shop;

  // get user cart

  List<Product> get cart => _cart;

  // add item to cart

  void addToCart(Product item) {
    _cart.add(item);
    notifyListeners();
  }

  
  // remove item from cart

  void removeFromCart(Product item) {
    _cart.remove(item);
    notifyListeners();
  }
}
