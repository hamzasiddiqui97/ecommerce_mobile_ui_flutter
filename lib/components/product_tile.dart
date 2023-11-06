import 'package:flutter/material.dart';
import 'package:minimal_ecom_app/models/product.dart';
import 'package:minimal_ecom_app/models/shop.dart';
import 'package:provider/provider.dart';


class MyProductTile extends StatelessWidget {
  final Product product;
  const MyProductTile({Key? key, required this.product}) : super(key: key);


  void addToCart(BuildContext context) {
    showDialog(context: context, builder: (context) => AlertDialog(
      content: Text('Add this item to your cart?'),
      actions: [
        // cancel button
        MaterialButton(onPressed: ()=> Navigator.pop, child: Text('Cancel'),),

        // yes button
        MaterialButton(
          onPressed: () {
            // close dialog box
            Navigator.pop(context);
            // add item to cart
            context.read<Shop>().addToCart(product);
            print(product.name);
          },
          child: Text('Yes'),),

      ],
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.inversePrimary,
        borderRadius: BorderRadius.circular(20),
        
      ),
      width: MediaQuery.of(context).size.width / 1.5,
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,

        children: [

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,


            children: [
              // product image
              AspectRatio(
                aspectRatio: 1,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),

                  ),
                  width: double.infinity,
                  padding: EdgeInsets.all(24),
                  child: Image.asset(product.imagePath,),
                ),
              ),

              const SizedBox(height: 25,),

              // product name
              Text(
                product.name,
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
              // product description

              Text(product.description
                ,
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.normal,
                ),
              ),

            ],
          ),

          // product price + add to cart button
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('\$ ${product.price.toStringAsFixed(2)}'),

              Container(

                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                  borderRadius: BorderRadius.circular(12)
                ),
                  child: IconButton(onPressed: () => addToCart(context), icon: Icon(Icons.add,),))

            ],
          ),


        ],
      ),
    );
  }
}
