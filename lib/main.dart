import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
// import 'shopping_cart.dart';
import 'scan_screen.dart';
// import 'profile_screen.dart';
// import 'navbar.dart';

void main() => runApp(FlashChat());

class FlashChat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "profile_screen",
      // initialRoute: "navbar",
      routes: {
        "scan_screen": (context) => QrCode(), //QrCode(),
        // "profile_screen": (context) => ProfileScreen(),
        // "navbar" : (contect) => BottomNavBar(),
      },
    );
  }
}