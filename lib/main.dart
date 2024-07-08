import 'package:flutter/material.dart';

import 'package:myapp/services/stock_services.dart';
import 'package:myapp/sreens/home_screen.dart';
import 'package:myapp/sreens/produksi_screen.dart';
import 'package:myapp/sreens/seller_screen.dart';
import 'package:myapp/sreens/stock_screen.dart';
import 'package:provider/provider.dart';
import 'widgets/bottom_nav_bar.dart';

void main() {
  runApp(MyApp());
}

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

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    HomeScreen(),
    StockScreen(),
    ProduksiScreen(),
    SellerScreen(),
  ];

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavBar(
        currentIndex: _currentIndex,
        onTap: _onTabTapped,
      ),
    );
  }
}
