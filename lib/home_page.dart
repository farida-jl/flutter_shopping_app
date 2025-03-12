import 'package:flutter/material.dart';
import 'package:flutter_shopping_app/shared/color_resource.dart';
import 'package:flutter_shopping_app/shared/text_styles.dart';

import 'feature/cart/presentation/cart_page.dart';
import 'feature/shopping/presentation/shopping_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    ShoppingPage(),
    CartPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: SizedBox(
        height: 80,
        child: BottomNavigationBar(
          elevation: 0,
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          selectedFontSize: 0,
          unselectedFontSize: 0,
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          backgroundColor: ColorResource.surfaceContainerColor,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: _selectedIndex == 0
                    ? _activeNavBar('Shopping')
                    : _inActiveNavBar('Shopping'),
                label: ''
            ),
            BottomNavigationBarItem(
                icon: _selectedIndex == 1
                    ? _activeNavBar('Cart')
                    : _inActiveNavBar('Cart'),
                label: ''
            ),
          ],
        ),
      ),
    );
  }

  Widget _activeNavBar(String title) {
    return Column(
      children: [
        Container(
          width: 64,
          height: 32,
          decoration: BoxDecoration(
            color: ColorResource.secondaryColor,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Icon(Icons.stars_rounded, color: ColorResource.onSurfaceColor),
        ),
        Text(
          title,
          style: fontLabelMediumProminent.copyWith(color: ColorResource.onSurfaceColor),
        )
      ],
    );
  }

  Widget _inActiveNavBar(String title) {
    return Column(
      children: [
        SizedBox(
            height: 32,
            child: Icon(Icons.stars_outlined, color: ColorResource.onSurfaceVariantColor)
        ),
        Text(
          title,
          style: fontLabelMedium.copyWith(color: ColorResource.onSurfaceVariantColor),
        )
      ],
    );
  }
}