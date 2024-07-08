import 'package:flutter/material.dart';
import 'package:myapp/services/product_services.dart';
import 'package:provider/provider.dart';
import '../models/product.dart';

// ignore: use_key_in_widget_constructors
class AddProductDialog extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _AddProductDialogState createState() => _AddProductDialogState();
}

class _AddProductDialogState extends State<AddProductDialog> {
  final _formKey = GlobalKey<FormState>();
  String _name = '';
  int _price = 0;
  int _qty = 0;
  String _attr = '';
  int _weight = 0;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Tambah Produk'),
      content: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              decoration: const InputDecoration(labelText: 'Nama'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Masukkan nama';
                }
                return null;
              },
              onSaved: (value) {
                _name = value!;
              },
            ),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Harga'),
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Masukkan harga';
                }
                return null;
              },
              onSaved: (value) {
                _price = int.parse(value!);
              },
            ),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Jumlah'),
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Masukkan jumlah';
                }
                return null;
              },
              onSaved: (value) {
                _qty = int.parse(value!);
              },
            ),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Atribut'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Masukkan atribut';
                }
                return null;
              },
              onSaved: (value) {
                _attr = value!;
              },
            ),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Berat'),
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Masukkan berat';
                }
                return null;
              },
              onSaved: (value) {
                _weight = int.parse(value!);
              },
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Batal'),
        ),
        TextButton(
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              _formKey.currentState!.save();
              Provider.of<ProductService>(context, listen: false).addProduct(Product(id: '', name: _name, price: _price, qty: _qty, attr: _attr, weight: _weight));
              Navigator.of(context).pop();
            }
          },
          child: const Text('Tambah'),
        ),
      ],
    );
  }
}
