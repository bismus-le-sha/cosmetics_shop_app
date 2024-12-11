import 'package:flutter/material.dart';
import 'package:shop/bottom_navigation.dart';

class ShopApp extends StatelessWidget {
  const ShopApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: BottomNavigation());
  }
}
