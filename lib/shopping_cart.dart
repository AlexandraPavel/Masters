import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'scan_screen.dart';

class ShoppingScreen extends StatefulWidget{
  List<String> products;

  ShoppingScreen(this.products);

  @override
  _ShoppingScreenState createState () => _ShoppingScreenState(products);
}

class _ShoppingScreenState extends State<ShoppingScreen> {
  List<String> products;
  _ShoppingScreenState(this.products);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          padding: const EdgeInsets.all(8),
          itemCount: products.length,
          itemBuilder: (context, index) {
            return Container(
              height: 50,
              color: Colors.blue,
              child: Center(child: Text('Entry ${products[index]}')),
            );
          }
      ),
    );
  }
}