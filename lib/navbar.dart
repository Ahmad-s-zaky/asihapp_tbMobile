import 'package:flutter/material.dart';

// ignore: camel_case_types
class navAsih extends StatelessWidget {
  const navAsih({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: navigationBar());
  }
}

// ignore: camel_case_types
class navigationBar extends StatefulWidget {
  const navigationBar({super.key});

  @override
  State<navigationBar> createState() => _navigationBarState();
}

// ignore: camel_case_types
class _navigationBarState extends State<navigationBar> {
  int currentPageIndex = 0;
  NavigationDestinationLabelBehavior labelBehavior = NavigationDestinationLabelBehavior.alwaysShow;

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('Asih App'),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      bottomNavigationBar: NavigationBar(
        backgroundColor: Colors.green,
        indicatorColor: Colors.green[300],
        labelBehavior: labelBehavior,
        selectedIndex: currentPageIndex,
        onDestinationSelected: (int index){
          setState(() {
            currentPageIndex = index;
          });
        },
        destinations: const <Widget>[
          NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
          NavigationDestination(icon: Icon(Icons.inventory_2), label: 'Stock'),
          NavigationDestination(icon: Icon(Icons.conveyor_belt), label: 'Product'),
          NavigationDestination(icon: Icon(Icons.storefront), label: 'Seller'),
        ],
      ),
    );
  }
}
