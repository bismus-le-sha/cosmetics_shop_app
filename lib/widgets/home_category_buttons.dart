import 'package:flutter/material.dart';

class HomeCategoryButtons extends StatelessWidget {
  const HomeCategoryButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Center(
        child: Wrap(
          spacing: 7,
          runSpacing: 7,
          children: [
            _buildFilterButton('Для очищения'),
            _buildFilterButton('Для увлажнения'),
            _buildFilterButton('Для питания'),
            _buildFilterButton('Для омоложения'),
          ],
        ),
      ),
    );
  }
}

Widget _buildFilterButton(String label) {
  return SizedBox(
    width: 200,
    height: 60,
    child: OutlinedButton(
      onPressed: () {},
      style: OutlinedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(9),
        ),
        side: BorderSide(color: Colors.grey.shade300),
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
      ),
      child: Text(label, textAlign: TextAlign.center),
    ),
  );
}
