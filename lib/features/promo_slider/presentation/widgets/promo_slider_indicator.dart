import 'package:flutter/material.dart';

class PromoSliderIndicator extends StatelessWidget {
  final int slideCount;
  final int currentPage;
  const PromoSliderIndicator(
      {super.key, required this.slideCount, required this.currentPage});

  @override
  Widget build(BuildContext context) {
    const maxVisibleDots = 5;

    int start = (currentPage - maxVisibleDots ~/ 2)
        .clamp(0, slideCount - maxVisibleDots);
    int end = (start + maxVisibleDots).clamp(0, slideCount);

    return Positioned(
      top: 60,
      left: 20,
      right: 20,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(end - start, (i) {
          int index = start + i;
          double size = (i == 0 || i == end - start - 1) ? 6 : 8;
          if (index == currentPage) size = 12;
          return AnimatedContainer(
            duration: const Duration(milliseconds: 250),
            width: size,
            height: size,
            margin: const EdgeInsets.symmetric(horizontal: 4),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: index == currentPage
                  ? Colors.white
                  : Colors.white.withAlpha(50),
            ),
          );
        }),
      ),
    );
  }
}
