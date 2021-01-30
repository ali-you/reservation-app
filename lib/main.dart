import 'package:flutter/material.dart';
import 'package:reservation/LoginPage.dart';
import 'package:reservation/MainPage.dart';
import './Animation/FadeAnimation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
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
  int _counter = 0;

  @override
  void initState() {
    FirebaseAuth.instance.currentUser().then((currentUser) => {
      if (currentUser == null)
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage()))
      else{
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MainPage()))
      }
    }).catchError((err) => print(err));

    // TODO: implement initState
    super.initState();
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
  }
}
