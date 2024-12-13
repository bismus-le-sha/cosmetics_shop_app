import 'package:flutter/material.dart';
import 'package:shop/shop_app.dart';
import 'injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const ShopApp());
}
