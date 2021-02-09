import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:reservation/MainPage.dart';
import 'package:reservation/shoppingBasketPage.dart';

class DoctorPage extends StatefulWidget {
  String drNumber, image, firstName, lastName, degree, weekday, uid;



  DoctorPage(
      this.uid, this.drNumber, this.image, this.firstName, this.lastName, this.degree, this.weekday);

  @override
  _State createState() => _State();
}

class _State extends State<DoctorPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Reservation", style: TextStyle(color: Colors.black)),
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
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.folder_shared,
              color: Colors.black54,
            ),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ShoppingBasketPage(widget.uid)));
            },
          )
        ],
      ),
      body: StreamBuilder(
        stream: Firestore.instance.collection("Doctor").document(widget.drNumber).collection("description").snapshots(),
        builder: (context, snapshot){
          return Scrollbar(
            child: Padding(
              padding: EdgeInsets.all(15),
              child: Column(
                children: <Widget>[

                  Image.network(widget.image, height: 150, width: 150),

                  Padding(
                    padding: EdgeInsets.all(10),
                    child:
                    Text(widget.firstName + " " + widget.lastName,
                        style: TextStyle(fontSize: 25), textAlign: TextAlign.center),
                  ),

                  Text(widget.degree,
                      style: TextStyle(fontSize: 18), textAlign: TextAlign.center),

                  Divider(),

                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Address:",
                      style: TextStyle(fontSize: 25),
                    ),
                  ),

                  SizedBox(height: 8),

                  Text(
                    snapshot.data.documents[0]["address"] + " ," + snapshot.data.documents[0]["city"] ,
                    style: TextStyle(fontSize: 20),
                  ),

                  Divider(),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text("Time:   " + widget.weekday + "     " + snapshot.data.documents[0]["dur"],
                          style: TextStyle(fontSize: 20, color: Colors.grey[900]),
                          textDirection: TextDirection.rtl,
                          textAlign: TextAlign.center),
                    ),
                  ),

                  Divider(),
                  SizedBox(height: 15),

                  Text(
                    "Fee: " + snapshot.data.documents[0]["fee"].toString() + " T",
                    style: TextStyle(fontSize: 25, color: Colors.black),
                  ),
                  Expanded(
                    /** card method**/

                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 40),
                        child: Container(
                          height: 70,
                          width: MediaQuery.of(context).size.width - 50,
                          child: Material(
                            elevation: 5,
                            child: Builder(
                              builder: (context) => InkWell(
                                borderRadius: BorderRadius.circular(30),
                                onTap: () {
                                  Firestore.instance.collection("Patient")
                                  .document(widget.uid).collection("des").document("1").updateData({
                                    "res": widget.drNumber
                                  });
//                                  if(!ShoppingBasketData.getInstance().basketItems.contains(_product))
//                                    ShoppingBasketData.getInstance()
//                                        .basketItems
//                                        .add(_product);
                                  final snack = SnackBar(
                                    duration: Duration(milliseconds: 3500),
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(30),
                                        side: BorderSide(
                                            color: Colors.greenAccent, width: 2)),
                                    content: Text(
                                      "The appointment of ${widget.firstName + " " + widget.lastName} is taken",
                                      style: TextStyle(fontSize: 12),
                                    ),
                                    action:
                                    SnackBarAction(label: "Undo", onPressed: () {}),
                                  );
                                  Scaffold.of(context).showSnackBar(snack);
                                },
                                child: Center(
                                    child: Text(
                                      "Make an appointment",
                                      style: TextStyle(fontSize: 20, color: Colors.white),
                                    )),
                              ),
                            ),
                            color: Color.fromRGBO(49, 39, 79, 1),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30)),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
