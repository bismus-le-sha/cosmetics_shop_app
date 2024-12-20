import 'package:flutter/material.dart';
import 'package:shop/config/router/router.dart';
import 'injection_container.dart' as di;

class ShopApp extends StatelessWidget {
  const ShopApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: di.sl<AppRouter>().config(),
    );
  }
}
