import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const BottomNavBar({required this.currentIndex, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      selectedIndex: currentIndex,
      onDestinationSelected: onTap,
      backgroundColor: Colors.green, // Background color
      indicatorColor: Colors.green[300],
      labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
      destinations: const[
         NavigationDestination(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        NavigationDestination(
          icon: Icon(Icons.storage),
          label: 'Stock',
        ),
        NavigationDestination(
          icon: Icon(Icons.production_quantity_limits),
          label: 'Produksi',
        ),
        NavigationDestination(
          icon: Icon(Icons.store),
          label: 'Seller',
        )
      ],
    );
  }
}