import 'package:flutter/material.dart';
import 'package:myapp/models/product.dart';
import 'package:provider/provider.dart';
import '../services/product_services.dart';

class EditProductDialog extends StatefulWidget {
  final int index;
  final Product product;

  EditProductDialog({required this.index, required this.product});

  @override
  _EditProductDialogState createState() => _EditProductDialogState();
}

class _EditProductDialogState extends State<EditProductDialog> {
  final _formKey = GlobalKey<FormState>();
  late String _name;
  late int _price;
  late int _qty;
  late String _attr;
  late int _weight;

  @override
  void initState() {
    super.initState();
    _name = widget.product.name;
    _price = widget.product.price;
    _qty = widget.product.qty;
    _attr = widget.product.attr;
    _weight = widget.product.weight;
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Edit Produk'),
      content: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              initialValue: _name,
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
              initialValue: _price.toString(),
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
              initialValue: _qty.toString(),
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
              initialValue: _attr,
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
              initialValue: _weight.toString(),
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
              Provider.of<ProductService>(context, listen: false)
                  .updateProduct(widget.index, Product(name: _name, price: _price, qty: _qty, attr: _attr, weight: _weight, id: widget.product.id));
              Navigator.of(context).pop();
            }
          },
          child: const Text('Simpan'),
        ),
      ],
    );
  }
}
