import 'package:flutter/material.dart';
import 'package:sip_savor/components/buttom_nav.dart';
import 'package:sip_savor/pages/shop_page.dart';
import '../const.dart';
import 'cart_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  void navigateButtomBar(int, index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _pages = [

    ShopPage(),

    CartPage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      bottomNavigationBar: ButtomNav(
        onTabChange: (index) => navigateButtomBar(int, index),
      ),
      body: _pages[_selectedIndex],
    );
  }
}
