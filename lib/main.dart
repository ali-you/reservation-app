import 'package:flutter/material.dart';
import 'package:reservation/LoginPage.dart';
import 'package:reservation/MainPage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Reservation',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'reservation'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    FirebaseAuth.instance.currentUser().then((currentUser) => {
      if (currentUser == null)
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage()))
      else{
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MainPage(currentUser.uid)))
      }
    }).catchError((err) => print(err));

    return Scaffold(
      backgroundColor: const Color(0x0f052f),
      body: Center(

      ),
    );
  }
}
