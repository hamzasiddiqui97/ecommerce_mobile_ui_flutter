import 'package:flutter/material.dart';
import 'package:minimal_ecom_app/components/my_list_tile.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // drawer header logo

          Column(
            children: [
              DrawerHeader(
                child: Center(
                  child: Icon(
                    Icons.shopping_bag,
                    size: 72,
                    color: Theme.of(context).colorScheme.inversePrimary,
                  ),
                ),
              ),

              // shop tile
              MyListTile(
                  text: 'Shop',
                  icon: Icons.home,
                  onTap: () => Navigator.pop(context)),

              //cart tile
              MyListTile(
                text: 'Cart',
                icon: Icons.shopping_cart,
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, '/cart_page');
                },
              ),
            ],
          ),
          // exit shop tile

          Padding(
            padding: const EdgeInsets.only(bottom: 25.0),
            child:
                MyListTile(text: 'Exit', icon: Icons.exit_to_app, onTap: () => Navigator.pushNamed(context, '/intro_page'),),
          ),
        ],
      ),
    );
  }
}
