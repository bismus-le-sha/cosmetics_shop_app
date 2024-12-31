import 'package:flutter/material.dart';

import '../../domain/entities/subcatalogue_entity.dart';

class SubcatalogueListDisplay extends StatelessWidget {
  final String lable;
  final List<SubcatalogueEntity> items;
  const SubcatalogueListDisplay(
      {super.key, required this.items, required this.lable});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(lable),
      ),
      body: Column(
        children: [
          Expanded(
              child: ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              final item = items[index];
              return ListTile(
                title: Text(
                  item.title,
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w400),
                ),
                onTap: () {},
              );
            },
          )),
        ],
      ),
    );
  }
}
