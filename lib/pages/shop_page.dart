import 'package:flutter/material.dart';
import 'package:minimal_ecom_app/components/my_drawer.dart';
import 'package:minimal_ecom_app/components/product_tile.dart';
import 'package:minimal_ecom_app/models/shop.dart';
import 'package:provider/provider.dart';

class ShopPage extends StatelessWidget {
  const ShopPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    // access products in shop
    final products = context.watch<Shop>().shop;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shop Page'),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        foregroundColor: Theme.of(context).colorScheme.primary,
        actions: [
          // cart button
          
          IconButton(onPressed: ()=> Navigator.pushNamed(context, '/cart_page'), icon: Icon(Icons.shopping_cart))
        ],

      ),
      drawer: const MyDrawer(),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: 550,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: products.length,
            padding: const EdgeInsets.all(15),
            itemBuilder: (context, index){

          // get each individual product from shop
          final product = products[index];
          return MyProductTile(product: product);

          }),
      ),

    );
    
  }
}
