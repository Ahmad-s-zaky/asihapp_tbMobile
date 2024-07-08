import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:myapp/routing/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyNav extends ConsumerWidget {
  const MyNav({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(goRouterProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Asih App'),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      bottomNavigationBar: NavigationBar(
        backgroundColor: Colors.green,
        onDestinationSelected: (index){
        context.pop()
        ref.read(provider).update(index);
      },
      selectedIndex: currentIndex,
      children: const[
        Padding(
          padding: EdgeInsets.fromLTRB(left, top, right, bottom),
          
        )
        NavigationDestination(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        NavigationDestination(
          icon: Icon(Icons.inventory_2),
          label: 'Stock',
        ),
        NavigationDestination(
          icon: Icon(Icons.conveyor_belt),
          label: 'Product',
        ),
        NavigationDestination(
          icon: Icon(Icons.storefront),
          label: 'Seller',
        ),
      ],
    );
  }
}