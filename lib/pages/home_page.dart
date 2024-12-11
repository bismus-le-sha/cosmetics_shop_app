import 'package:flutter/material.dart';
import 'package:shop/widgets/scrollable_section.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.zero,
        children: const [
          SizedBox(
              height: 300,
              child: Image(image: AssetImage('assets/images/promo_image.png'))),
          ScrollableSection(
            title: 'Новинки',
          ),
        ],
      ),
    );
  }
}
