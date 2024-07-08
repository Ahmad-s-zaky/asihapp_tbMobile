/*import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:myapp/screens/stock/stock_screen.dart';
import 'package:myapp/screens/product/product_screen.dart';
import 'package:myapp/screens/seller/seller_screen.dart';
import 'package:myapp/models/stock.dart';
import 'package:myapp/models/product.dart';
import 'package:myapp/models/seller.dart';

import '../models/stock.dart';
import '../screens/home_screen.dart';

enum AppRoute {
  homeScreen,
  stockScreen,
  productScreen,
  sellerScreen,
  sellerDetailScreen,
  sellerCartScreen,
}

// ignore: non_constant_identifier_names
final goRouterProvider = StateProvider<GoRouter>((ref) {
  return GoRouter(initialLocation: '/home', routes: [
    GoRoute(
      name: AppRoute.homeScreen.name,
      path: '/home',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      name: AppRoute.stockScreen.name,
      path: '/stock',
      builder: (context, state) => const StockScreen(),
    ),
    GoRoute(
      name: AppRoute.productScreen.name,
      path: '/product',
      builder: (context, state) => const ProductScreen(),
    ),
    GoRoute(
        name: AppRoute.sellerScreen.name,
        path: '/seller',
        builder: (context, state) => const SellerScreen(),
        routes: [
          GoRoute(
            name: AppRoute.sellerDetailScreen.name,
            //path belum disesuaikan
            path: 'detail',
            builder: (context, state) => const SellerDetailScreen(),
          ),
          GoRoute(
            name: AppRoute.sellerCartScreen.name,
            //path belum disesuaikan
            path: 'cart',
            builder: (context, state) => const SellerCartScreen(),
          ),
        ]),
  ]);
});*/
