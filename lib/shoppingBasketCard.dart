import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:reservation/Doctor.dart';


// ignore: must_be_immutable
typedef OnRemovePressed(int index);
class ShoppingBasketCard extends StatefulWidget {
  int _counter = 1;
  Doctor _product;
  OnRemovePressed _onRemovePressed;
  int _index;

  ShoppingBasketCard(this._product, this._onRemovePressed, this._index);

  @override
  _ShoppingBasketCardState createState() => _ShoppingBasketCardState();
}

class _ShoppingBasketCardState extends State<ShoppingBasketCard> {

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      elevation: 6,
      child: Container(
        height: 150,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              height: 100,
              width: 100,
              child: Image.network(widget._product.image),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text(widget._product.firstName + widget._product.lastName, style: TextStyle(fontSize: 18)),
                Text(widget._product.fee.toString(), style: TextStyle(fontSize: 18)),
              ],
            ),
            Row(
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.remove,color: Colors.grey),
                  onPressed: (){
                    decrement();
                  },
                ),
                Text(widget._counter.toString(), style: TextStyle(fontSize: 18)),
                IconButton(
                  icon: Icon(Icons.add,color: Colors.blue),
                  onPressed: (){
                    increment();
                  },
                )
              ],
            ),
            Align(
                alignment: Alignment.topRight,
              child: IconButton(
                onPressed: (){
                  widget._onRemovePressed(widget._index);
                },
                icon: Icon(Icons.delete_forever),

              ),
            ),
          ],
        ),
      ),
    );
  }
  void increment(){
    setState(() {
      widget._counter++;
    });
  }

  void decrement(){
    setState(() {
      if(widget._counter > 0)
        widget._counter--;
    });
  }

}
