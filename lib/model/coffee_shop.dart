import 'package:flutter/material.dart';
import 'coffee_model.dart';

class CoffeeShop extends ChangeNotifier {
  final List<Coffee> _shop = [
    Coffee(
        name: 'Black Coffee',
        price: '20.0',
        image: 'lib/images/coffee-cup.png'),
    Coffee(name: 'Hot Coffee', price: '40.0', image: 'lib/images/hotCup.png'),
    Coffee(
        name: 'Ice Coffee', price: '20.0', image: 'lib/images/hot-coffee.png'),
    Coffee(
        name: 'sugar Coated Coffee', price: '50.0', image: 'lib/images/sugar-cube.png')
  ];

  List<Coffee> _userCart = [];

  List<Coffee> get coffeeShop => _shop;

  List<Coffee> get userCart => _userCart;

  addCoffee(Coffee coffee) {
    _userCart.add(coffee);
    notifyListeners();
  }

  removeCoffee(Coffee coffee) {
    _userCart.remove(coffee);
    notifyListeners();
  }
}
