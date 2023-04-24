import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sip_savor/model/coffee_model.dart';
import 'package:sip_savor/model/coffee_shop.dart';

import '../components/coffee_tile.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  void removeFromCart(Coffee coffee) {
    Provider.of<CoffeeShop>(context, listen: false).removeCoffee(coffee);
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
                      'Your Cart',
                      style: TextStyle(fontSize: 20),
                    ),
                    Expanded(
                         child: ListView.builder(
                          itemCount:  value.userCart.length,
                          itemBuilder: (context, index) {
                      Coffee eachCoffee = value.userCart[index];

                      return CoffeeTile(
                        coffee: eachCoffee,
                        onPressed: ()=> removeFromCart(eachCoffee),
                        icon: Icon(Icons.delete),
                      );
                    }))
                  ],
                ),
              ),
            ));
  }
}
