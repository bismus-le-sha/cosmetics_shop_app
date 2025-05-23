import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:shop/widgets/take_test_widget.dart';

import '../../../../config/router/router.dart';
import '../../domain/entities/catalogue_entity.dart';

class CatalogueListDisplay extends StatelessWidget {
  final List<CatalogueEntity> items;

  const CatalogueListDisplay({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const TextField(
          decoration: InputDecoration(
            hintText: 'Поиск',
            border: InputBorder.none,
            prefixIcon: Icon(Icons.search),
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 1,
        foregroundColor: Colors.black,
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
                trailing: item.icon != null
                    ? Icon(
                        item.icon,
                        color: Colors.pink,
                      )
                    : null,
                onTap: () => context.router.push(SubcatalogueRoute(
                    lable: (item.appBarTitile != null
                        ? item.appBarTitile!
                        : item.title),
                    items: item.items)),
              );
            },
          )),
          const CTTWidget(),
        ],
      ),
    );
  }
}
