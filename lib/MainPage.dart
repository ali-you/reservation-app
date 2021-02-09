import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart';
import 'package:reservation/Doctor.dart';
import 'package:reservation/LoginPage.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:reservation/shoppingBasketPage.dart';

import 'DoctorPage.dart';

class MainPage extends StatefulWidget {
  final String uid;
  MainPage(this.uid);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  List<Doctor> items = [];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Color(0xff21254A),
      drawer: StreamBuilder(
        stream: Firestore.instance.collection("Patient").document(widget.uid).collection("des").snapshots(),
        builder: (context, snapshot){
          return Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                DrawerHeader(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Align(
                        child: Text(
                          snapshot.data.documents[0]["firstName"] + " " + snapshot.data.documents[0]["lastName"],
                          style: TextStyle(fontSize: 35),
                        ),
                        alignment: Alignment.centerLeft,
                      ),
                      Align(
                        child: Text(
                          snapshot.data.documents[0]["email"],
                          style: TextStyle(fontSize: 15),
                        ),
                        alignment: Alignment.centerLeft,
                      ),
                      Align(
                        child: Text(
                          snapshot.data.documents[0]["phoneNumber"],
                          style: TextStyle(fontSize: 15),
                        ),
                        alignment: Alignment.centerLeft,
                      ),
                    ],
                  ),
                  decoration: BoxDecoration(
                    color: Colors.deepPurple,
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.edit),
                  title: Text("Edit Profile"),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  leading: Icon(Icons.settings),
                  title: Text("Setting"),
                ),

                ListTile(
                  leading: Icon(Icons.exit_to_app),
                  title: Text("Logout"),
                  onTap: (){
                    FirebaseAuth.instance.signOut().then((value) =>
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage())));
                  },
                ),
                Divider(),
                ListTile(
                  leading: Icon(Icons.info_outline),
                  title: Text("About"),
                ),

              ],
            ),
          );
        },
      ),
      appBar: AppBar(
        title: Text("Reservation  ", style: TextStyle(color: Colors.black)),
        centerTitle: true,
//          leading: Icon(Icons.arrow_back),
        iconTheme: IconThemeData(color: Colors.black54),
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
          stream: Firestore.instance.collection('Doctor').snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) return const Text("Check your connection");
            return Scrollbar(
              child: Padding(
                padding: EdgeInsets.all(10),
                child: GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 7,
                  mainAxisSpacing: 7,
                  children: List.generate(snapshot.data.documents.length, (int index){
                    return Card(
                      color: Colors.grey[300],
                      elevation: 5,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(30),
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(
                              builder: (context) => DoctorPage(
                                widget.uid,
                                snapshot.data.documents[index]["drNumber"],
                                snapshot.data.documents[index]["image"],
                                snapshot.data.documents[index]["firstName"],
                                snapshot.data.documents[index]["lastName"],
                                snapshot.data.documents[index]["degree"],
                                snapshot.data.documents[index]["weekday"]
                              )));
                        },
                        child: ListTile(
                          title: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Container(
                                  height: 100,
                                  width: 100,
                                  child:CachedNetworkImage(
                                    placeholder: (context, url) => CircularProgressIndicator(),
                                    imageUrl: snapshot.data.documents[index]['image'],
                                  )
                              ),

                              Text(
                                  snapshot.data.documents[index]['firstName'] +" "+ snapshot.data.documents[index]["lastName"],
                                  style: TextStyle(fontSize: 16),
                                ),

                              Text(
                                snapshot.data.documents[index]["degree"],
                                style: TextStyle(fontSize: 14),
                              )


                            ],
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              ),
            );
          }
      ),
    );
  }
}
