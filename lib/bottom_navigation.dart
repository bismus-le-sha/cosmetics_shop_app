import 'package:flutter/material.dart';
import 'package:shop/pages/home_page.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: HomePage(), bottomNavigationBar: CustomBottomNavigationBar());
  }
}

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width: double.infinity,
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(
            color: Color(0xFFCBCBD5),
            width: 0.5,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildNavItem(const AssetImage('assets/icons/House.png'), 'Главная',
              isSelected: true),
          _buildNavItem(
              const AssetImage('assets/icons/MagnifyingGlass.png'), 'Каталог'),
          _buildNavItem(const AssetImage('assets/icons/ShoppingCartSimple.png'),
              'Корзина'),
          _buildNavItem(const AssetImage('assets/icons/User.png'), 'Профиль'),
        ],
      ),
    );
  }

  Widget _buildNavItem(ImageProvider icon, String label,
      {bool isSelected = false}) {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ImageIcon(
            icon,
            color: isSelected ? Colors.black : Colors.grey,
          ),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              color: isSelected ? Colors.black : Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
