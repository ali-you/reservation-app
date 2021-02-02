import 'package:flutter/material.dart';
import 'package:reservation/shoppingBasketCard.dart';
import 'package:reservation/shoppingBasketData.dart';

class ShoppingBasketPage extends StatefulWidget {
  String drNumber;
  ShoppingBasketPage(this.drNumber);
  @override
  _ShoppingBasketPageState createState() => _ShoppingBasketPageState();
}

class _ShoppingBasketPageState extends State<ShoppingBasketPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Shopping Basket", style: TextStyle(color: Colors.black)),
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
      body: Padding(
        padding: EdgeInsets.all(5),
        child: ListView.builder(
            itemCount: ShoppingBasketData.getInstance().basketItems.length,
            itemBuilder: (context, position) {
              return ShoppingBasketCard(
                  ShoppingBasketData.getInstance().basketItems[position], removeItem, position);
            }),
      ),
    );
  }
  void removeItem(int index){
    setState(() {
      ShoppingBasketData.getInstance().basketItems.removeAt(index);
    });
  }
}
