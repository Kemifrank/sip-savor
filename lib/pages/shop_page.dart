import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sip_savor/model/coffee_shop.dart';
import '../components/coffee_tile.dart';
import '../model/coffee_model.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  void addToCart(Coffee coffee) {
    Provider.of<CoffeeShop>(context, listen: false).addCoffee(coffee);

    showDialog(
        context: context,
        builder: (context) => const AlertDialog(
              title: Text('Successfully Added'),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CoffeeShop>(
        builder: (context, value, child) => SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(25.0),
                child: Column(
                  children: [
                    const Text(
                      'How would you like your coffee?',
                      style: TextStyle(fontSize: 20),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Expanded(
                        child: ListView.builder(
                      itemCount: value.coffeeShop.length,
                      itemBuilder: (context, index) {
                        Coffee eachCoffee = value.coffeeShop[index];

                        return CoffeeTile(
                          coffee: eachCoffee,
                          icon: const Icon(Icons.add),
                          onPressed: () => addToCart(eachCoffee),
                        );
                      },
                    ))
                  ],
                ),
              ),
            ));
  }
}
