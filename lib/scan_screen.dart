import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'shopping_cart.dart';
import 'paymen_handle.dart';

void main()=>runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  home: QrCode(),
));

class QrCode extends StatefulWidget{
  @override
  _QrCodeState createState () => _QrCodeState();
}

class _QrCodeState extends State<QrCode> {
  int amount = 200;
  String _data = "";
  List<String> products = [];

  _scan() async {
    await FlutterBarcodeScanner.scanBarcode(
        "#000000", "Cancel", true, ScanMode.BARCODE).then((value) => setState(() => products.add(value)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          FlatButton(child: Text("Scan Barcode"),
            onPressed: () => _scan(),
          ),
          FlatButton(child: Text("Shopping Cart"),
            onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => ShoppingScreen(products))),
          ),
          FlatButton(child: Text("Pay"),
            onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => Payment(amount))),
          ),
        ],),

    );
  }
}