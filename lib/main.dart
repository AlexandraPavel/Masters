import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'shopping_cart.dart';
import 'scan_screen.dart';

void main() => runApp(FlashChat());

class FlashChat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "scan_screen",
      routes: {
        "scan_screen": (context) => QrCode(),
      },
    );
  }
}