import 'package:flutter/material.dart';
import 'package:minimal_ecom_app/components/my_button.dart';
import 'package:minimal_ecom_app/models/product.dart';
import 'package:provider/provider.dart';

import '../models/shop.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  void removeFromCart(BuildContext context, Product product) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              content: const Text('Remove this item to your cart?'),
              actions: [
                // cancel button
                MaterialButton(
                  onPressed: () => Navigator.pop,
                  child: const Text('Cancel'),
                ),

                // yes button
                MaterialButton(
                  onPressed: () {
                    // close dialog box
                    Navigator.pop(context);
                    // add item to cart
                    context.read<Shop>().removeFromCart(product);
                    print('Product removed: ' + product.name);
                  },
                  child: const Text('Yes'),
                ),
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    // user pressed pay now button
    void payButtonPressed(BuildContext context) {
      showDialog(
        context: context,
        builder: (context) => const AlertDialog(
          content: Text(
              'User wants to pay, Connect this app to your payment method'),
        ),
      );
    }

    // get access to the cart
    final cart = context.watch<Shop>().cart;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart Page'),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        foregroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: Column(
        children: [
          Expanded(
            child: cart.isEmpty
                ? const Center(child: Text('Your Cart is Empty..', style: TextStyle(fontWeight: FontWeight.normal, fontSize: 26,),))
                : ListView.builder(
                    itemCount: cart.length,
                    itemBuilder: (context, index) {
                      // get individual item in cart
                      final item = cart[index];

                      return ListTile(
                        title: Text(item.name),
                        subtitle: Text(item.price.toStringAsFixed(2)),
                        trailing: IconButton(
                          icon: const Icon(Icons.remove),
                          onPressed: () => removeFromCart(context, item),
                        ),
                      );
                    },
                  ),
          ),

          // pay button
          Padding(
            padding: const EdgeInsets.all(40),
            child: MyButton(
                onTap: () => payButtonPressed(context), child: const Text('Pay Now')),
          ),
        ],
      ),
    );
  }
}
