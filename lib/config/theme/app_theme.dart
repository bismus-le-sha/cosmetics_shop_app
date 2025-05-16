import 'package:flutter/material.dart';

final appTheme = ThemeData();

class AppStyles {
  // Card style
  static const TextStyle productCardCategory = TextStyle(
    fontSize: 14,
  );
  static const TextStyle productCardLable = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
  );
  static const TextStyle productCardPrice = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );

  static const TextStyle productCardOldPrice = TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: Colors.grey,
      decoration: TextDecoration.lineThrough,
      decorationColor: Colors.grey);

  static final Color imagePlaceholderColor = Colors.grey.shade200;
}
