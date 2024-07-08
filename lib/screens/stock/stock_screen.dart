import 'package:flutter/material.dart';
import 'package:myapp/services/stock_services.dart';
import 'package:myapp/widgets/add_stock.dart';
import 'package:myapp/widgets/edit_stock.dart';
import 'package:provider/provider.dart';

// ignore: use_key_in_widget_constructors
class StockScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final stockService = Provider.of<StockService>(context);

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          const Text(
            'STOCK',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: stockService.stocks.length,
              itemBuilder: (context, index) {
                final stock = stockService.stocks[index];
                return Card(
                  color: Colors.green[200],
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '${stock.name}\n[${stock.quantity}]',
                          textAlign: TextAlign.center,
                          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                              icon: const Icon(Icons.edit),
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (context) => EditStockDialog(index: index, stock: stock),
                                );
                              },
                            ),
                            IconButton(
                              icon: const Icon(Icons.delete),
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                    title: const Text('Confirm Delete'),
                                    content: const Text('Are you sure you want to delete this stock?'),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: const Text('Cancel'),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          stockService.deleteStock(index);
                                          Navigator.of(context).pop();
                                        },
                                        child: const Text('Delete'),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          IconButton(
            icon: const Icon(Icons.add_box, size: 35,),
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => AddStockDialog(),
              );
            },
          ),
        ],
      ),
    );
  }
}