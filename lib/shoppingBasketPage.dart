import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:reservation/shoppingBasketCard.dart';
import 'package:reservation/shoppingBasketData.dart';

class ShoppingBasketPage extends StatefulWidget {
  String pNumber;
  ShoppingBasketPage(this.pNumber);
  @override
  _ShoppingBasketPageState createState() => _ShoppingBasketPageState();
}

class _ShoppingBasketPageState extends State<ShoppingBasketPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Appointments", style: TextStyle(color: Colors.black)),
        centerTitle: true,
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back,
              color: Colors.black,
            )),
        backgroundColor: Colors.deepPurple,
        elevation: 0,
      ),
      body: StreamBuilder(
        stream: Firestore.instance.collection("Patient").document(widget.pNumber).collection("des").snapshots(),
        builder: (context, snapshot){
          return Padding(
            padding: EdgeInsets.all(5),
            child: ListView.builder(
                itemCount: 1,
                itemBuilder: (context, position) {
                  return ShoppingBasketCard(
                      snapshot.data.documents[0]["res"]);
                }),
          );
        },
      ),
    );
  }
}
