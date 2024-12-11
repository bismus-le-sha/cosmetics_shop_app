import 'package:flutter/material.dart';

import '../features/product/presentation/widgets/section_widgets.dart';

class ScrollableSection extends StatelessWidget {
  final String title;
  const ScrollableSection({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionTitle(title: title),
        const SectionDivider(colors: [
          Colors.white,
          Colors.lightBlue,
        ]),
        const SizedBox(height: 16),
        const HorizontalItemList(),
      ],
    );
  }
}
