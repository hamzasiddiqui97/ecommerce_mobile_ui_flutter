import 'package:flutter/material.dart';
import 'package:minimal_ecom_app/components/my_button.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.shopping_bag,
              size: 72,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
            const SizedBox(height: 20,),
            const Text("Minimal Shop", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),),
            const SizedBox(height: 5,),
            const Text("Premium Quality Product", style: TextStyle(fontWeight: FontWeight.normal, fontSize: 20),),
            const SizedBox(height: 20,),

           MyButton(onTap: () => Navigator.pushNamed(context, '/shop_page'), child: const Icon(Icons.arrow_forward))
          ],
        ),
      ),
    );
  }
}
