import 'package:flutter/material.dart';
import 'package:myapp/services/stock_services.dart';
import 'package:myapp/widgets/add_stock.dart';
import 'package:myapp/widgets/edit_stock.dart';
import 'package:provider/provider.dart';

class StockScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final stockService = Provider.of<StockService>(context);

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Text(
            'STOCK',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 16),
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
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
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                              icon: Icon(Icons.edit),
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (context) => EditStockDialog(index: index, stock: stock),
                                );
                              },
                            ),
                            IconButton(
                              icon: Icon(Icons.delete),
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                    title: Text('Confirm Delete'),
                                    content: Text('Are you sure you want to delete this stock?'),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: Text('Cancel'),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          stockService.deleteStock(index);
                                          Navigator.of(context).pop();
                                        },
                                        child: Text('Delete'),
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
            icon: Icon(Icons.add_box),
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