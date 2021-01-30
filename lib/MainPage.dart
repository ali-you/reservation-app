import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart';
import 'package:reservation/LoginPage.dart';
import 'Product.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  List<Product> items = [];

  void fetch() async {
    var url = "http://welearnacademy.ir/flutter/products_list.json";
    Response response = await get(url);
    setState(() {
      var productJson = json.decode(utf8.decode(response.bodyBytes));
      for (var i in productJson) {
        var productItem = Product(i['product_name'], i['id'], i['price'],
            i['image_url'], i['off'], i['description']);
        items.add(productItem);
      }
    });
  }



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetch();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text(
                "Store",
                style: TextStyle(fontSize: 30),
              ),
              decoration: BoxDecoration(
                color: Colors.redAccent,
              ),
            ),
            ListTile(
              title: Text("Item 1"),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text("Item 2"),
            )
          ],
        ),
      ),
      appBar: AppBar(
        title: Text("Store", style: TextStyle(color: Colors.black)),
        centerTitle: true,
//          leading: Icon(Icons.arrow_back),
        iconTheme: IconThemeData(color: Colors.black54),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.map,
              color: Colors.black54,
            ),
            onPressed: () {
            },
          ),
          IconButton(
            icon: Icon(
              Icons.shopping_basket,
              color: Colors.black54,
            ),
            onPressed: () {

            },
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          children: List.generate(items.length, (int position) {
            return item(items[position], context);
          }),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: (){
            FirebaseAuth.instance.signOut().then((value) =>
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage())));
          },
          child: Icon(Icons.add)
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}



Card item(Product product, context) {
  return Card(
//    color: Colors.black,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(30),
    ),
    elevation: 5,
    child: InkWell(
      borderRadius: BorderRadius.circular(30),
      onTap: () {
      },
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              height: 100,
              width: 100,
              child: Image.network(product.imageUrl),
            ),
            Text(
              product.price,
              style: TextStyle(color: Colors.pinkAccent, fontSize: 16),
            ),
            Text(
              product.productName,
              style: TextStyle(color: Colors.blueGrey, fontSize: 14),
            )
          ],
        ),
      ),
    ),
  );
}
