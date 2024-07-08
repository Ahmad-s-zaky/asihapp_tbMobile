// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

import 'package:myapp/services/stock_services.dart';
import 'package:myapp/screens/home_screen.dart';
/*
import 'package:myapp/screens/product/produksi_screen.dart';
import 'package:myapp/screens/seller/seller_screen.dart';
*/
import 'package:myapp/screens/stock/stock_screen.dart';
import 'package:provider/provider.dart';
import 'widgets/bottom_nav_bar.dart';

void main() {
  runApp(MyApp());
}

// ignore: use_key_in_widget_constructors
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => StockService()),
      ],
      child: MaterialApp(
        title: 'Asih App',
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        home: MainScreen(),
      ),
    );
  }
}

// ignore: use_key_in_widget_constructors
class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    HomeScreen(),
    StockScreen(),
    /*
    ProduksiScreen(),
    SellerScreen(),
    */
  ];

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Asih App', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavBar(
        currentIndex: _currentIndex,
        onTap: _onTabTapped,
      ),
    );
  }
}