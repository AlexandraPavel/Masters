import 'package:flutter/material.dart';
import 'scan_screen.dart';
import 'products.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';

class ShoppingScreen extends StatefulWidget{
  List<String> products;

  ShoppingScreen(this.products);

  @override
  _ShoppingScreenState createState () => _ShoppingScreenState(products);
}

class _ShoppingScreenState extends State<ShoppingScreen> {
  List<String> pr;
  List<Products> postList = [];

  _ShoppingScreenState(this.pr);

  @override
  void initState() {
    super.initState();

    DatabaseReference postsRef = FirebaseDatabase.instance.reference().child(
        "Produse");

    postsRef.once().then((DataSnapshot snap) {
      var KEYS = snap.value.keys;
      var DATA = snap.value;

      postList.clear();

      for (var individualKey in KEYS) {
        Text(
            individualKey, style: TextStyle(color: Colors.black, fontSize: 10));
        Products prod = new Products(
          DATA[individualKey]['cod_de_bare'],
          DATA[individualKey]['ingrediente'],
          DATA[individualKey]['produs'],
          DATA[individualKey]['pret'],
        );
        postList.add(prod);
      }

      setState(() {
        print('Length : $postList.length');
      });
    });
  }

  double suma() {
    double s = 0;
    for (var i = 0; i < postList.length; i++) {
      s += this.postList[i].pret;
    }
    return s;
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text("Cosul de cumparaturi", style: TextStyle(fontSize: 20),),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(8),
        itemCount: postList.length,
        itemBuilder: (context, index) {
          return Container(
            height: 50,
            color: Colors.teal,
            child: Center(child: Text(
              '${postList[index].produs}.....${postList[index].pret} lei',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            ),

          );
        },
        separatorBuilder: (contex, index) => Divider(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.teal,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Colors.white,
            title: Container(height: 0.0),
            icon: Icon(Icons.face_outlined, color: Colors.white),
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.white,
            title: Text('Total: ' + this.suma().toString() + ' lei ', style: TextStyle(color: Colors.white, fontSize: 20.0)),
            icon: Icon(Icons.shopping_cart, color: Colors.white),
          ),
        ],
      ),
    );
  }
}