import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:reservation/Doctor.dart';


// ignore: must_be_immutable
typedef OnRemovePressed(int index);
class ShoppingBasketCard extends StatefulWidget {
  String drNumber;

  ShoppingBasketCard(this.drNumber);

  @override
  _ShoppingBasketCardState createState() => _ShoppingBasketCardState();
}

class _ShoppingBasketCardState extends State<ShoppingBasketCard> {

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Firestore.instance.collection("Doctor").document(widget.drNumber).collection("description").snapshots(),
      builder: (context, snapshot){
        return Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          elevation: 6,
          child: Container(
            height: 150,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
//                Container(
//                  height: 100,
//                  width: 100,
//                  child: Image.network(snapshot.data.documents[0]["city"]),
//                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text(snapshot.data.documents[0]["city"] , style: TextStyle(fontSize: 18)),
//                    Text(widget.drNumber.fee.toString(), style: TextStyle(fontSize: 18)),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

}
