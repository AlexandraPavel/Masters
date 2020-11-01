import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'shopping_cart.dart';
import 'paymen_handle.dart';
import 'profile_screen.dart';
// import 'navbar.dart';
// import 'package:curved_navigation_bar/curved_navigation_bar.dart';
// import 'settings_nav_bar.dart';
// import 'package:line_icons/line_icons.dart';


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
      backgroundColor: Colors.teal,
      body: //ListView(
        // children: [
           Padding(
             padding: EdgeInsets.only(left: 150.0, right: 0.0),
             child: RaisedButton(
               textColor: Colors.white,
               color: Colors.black,
               child: Text("Scan Barcode"),
               onPressed: () => _scan(),
               shape: new RoundedRectangleBorder(      borderRadius: new BorderRadius.circular(30.0),
               ),
            ),
             child: RaisedButton(
               textColor: Colors.white,
               color: Colors.black,
               child: Text("Shopping Cart"),
               onPressed: () => _scan(),
               shape: new RoundedRectangleBorder(      borderRadius: new BorderRadius.circular(30.0),
               ),
             ),
             child: RaisedButton(
               textColor: Colors.white,
               color: Colors.black,
               child: Text("Pay"),
               onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => Payment(amount))),
               shape: new RoundedRectangleBorder(      borderRadius: new BorderRadius.circular(30.0),
               ),
             ),
          // FlatButton(child: Text("Scan Barcode"),
          //   onPressed: () => _scan(),
          // ),
          //     child:
          // FlatButton(child: Text("Shopping Cart"),
          //   onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => ShoppingScreen(products))),
          // ),
          // FlatButton(child: Text("Pay"),
          //   onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => Payment(amount))),
          ),
        ),

    );
  }
}


// class MyBottomNavigationBar extends StatefulWidget {
//   @override
//   _MyBottomNavigationBarState createState() => _MyBottomNavigationBar_State();
// }
//
//   class _MyBottomNavigationBar_State extends State<MyBottomNavigationBar> {
//     int _selectedIndex = 1;
//     static const TextStyle optionStyle =
//     TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
//     final List<Widget> _widgetOptions = [
//       QrCode(),
//       ShoppingScreen(product),
//       ProfileScreen(),
//     ];
//   @override
//   Widget build(BuildContext context) {
//     return new Scaffold(
//       appBar: AppBar(
//         title: const Text('BottomNavigationBar Sample'),
//       ),
//       body: Center(
//         child: _widgetOptions.elementAt(_selectedIndex),
//       ),
//
//       MyBottomNavigationBar: Container(
//         decoration: BoxDecoration(color: Colors.white, boxShadow: [
//           // aici se schimba culoarea
//           BoxShadow(blurRadius: 20, color: Colors.black.withOpacity(.1))
//         ]),
//         child: SafeArea(
//           child: Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
//             child: GNav(
//                 gap: 8,
//                 activeColor: Colors.white,
//                 iconSize: 24,
//                 padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
//                 duration: Duration(milliseconds: 800),
//                 tabBackgroundColor: Colors.grey[800],
//                 tabs: [
//                   GButton(
//                     icon: LineIcons.search,
//                     text: 'Search',
//                   ),
//                   // GButton(
//                   //   icon: LineIcons.heart_o,
//                   //   text: 'Likes',
//                   // ),
//                   GButton(
//                     icon: LineIcons.home,
//                     text: 'Home',
//                   ),
//                   GButton(
//                     icon: LineIcons.user,
//                     text: 'Profile',
//                   ),
//                 ],
//                 selectedIndex: _selectedIndex,
//                 onTabChange: (index) {
//                   setState(() {
//                     _selectedIndex = index;
//                   });
//                 }),
//           ),
//         ),
//       ),
//     );
//   }
// }




