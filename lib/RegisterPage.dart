import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:reservation/MainPage.dart';
import './Animation/FadeAnimation.dart';

class RegisterPage extends StatelessWidget {
  TextEditingController firstNameController = new TextEditingController();
  TextEditingController lastNameController = new TextEditingController();
  TextEditingController phoneNumberController = new TextEditingController();
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  TextEditingController confirmPasswordController = new TextEditingController();
  final GlobalKey<FormState> _registerFormKey = GlobalKey<FormState>();
  String emailValidator(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value)) {
      return 'Email format is invalid';
    } else {
      return null;
    }
  }

  String passwordValidator(String value) {
    if (value.length < 6) {
      return 'Password must be longer than 6 characters';
    } else {
      return null;
    }
  }

  String nameValidator(String value) {
    Pattern pattern = r'^[A-Z a-z]*$';
    RegExp regExp = new RegExp(pattern);
    if (!regExp.hasMatch(value))
      return "Invalid name";
    else if (value.length < 3)
      return "Name is too short";
    else
      return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xff21254A),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            height: 200,
            child: Stack(
              children: <Widget>[
                Positioned(
                    child: FadeAnimation(
                  1,
                  Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage("assets/images/1.png"),
                      ),
                    ),
                  ),
                ))
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                FadeAnimation(
                  1,
                  Container(
                    padding: EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.transparent,
                    ),
                    child: SingleChildScrollView(
                      child: Form(
                        key: _registerFormKey,
                        child: Column(
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.all(10.0),
                              child: TextFormField(
                                controller: firstNameController,
                                style: TextStyle(color: Colors.white),
                                keyboardType: TextInputType.text,
                                validator: nameValidator,
                                textInputAction: TextInputAction.next,
                                onFieldSubmitted: (v) =>
                                    FocusScope.of(context).nextFocus(),
                                decoration: InputDecoration(
                                  enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.white, width: 1.25)),
                                  focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.white, width: 1.25)),
                                  hintText: "First name",
                                  hintStyle: TextStyle(color: Colors.grey),
                                  prefixIcon: Icon(Icons.person,
                                      color: Colors.deepPurple[200]),
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(10.0),
                              child: TextFormField(
                                controller: lastNameController,
                                style: TextStyle(color: Colors.white),
                                keyboardType: TextInputType.text,
                                validator: nameValidator,
                                textInputAction: TextInputAction.next,
                                onFieldSubmitted: (v) =>
                                    FocusScope.of(context).nextFocus(),
                                decoration: InputDecoration(
                                  enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.white, width: 1.25)),
                                  focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.white, width: 1.25)),
                                  hintText: "Last name",
                                  hintStyle: TextStyle(color: Colors.grey),
                                  prefixIcon: Icon(Icons.person,
                                      color: Colors.deepPurple[200]),
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(10.0),
                              child: TextFormField(
                                controller: phoneNumberController,
                                style: TextStyle(color: Colors.white),
                                keyboardType: TextInputType.phone,
                                textInputAction: TextInputAction.next,
                                onFieldSubmitted: (v) =>
                                    FocusScope.of(context).nextFocus(),
                                decoration: InputDecoration(
                                  enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.white, width: 1.25)),
                                  focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.white, width: 1.25)),
                                  hintText: "Phone number",
                                  hintStyle: TextStyle(color: Colors.grey),
                                  prefixIcon: Icon(Icons.smartphone,
                                      color: Colors.deepPurple[200]),
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(10.0),
                              child: TextFormField(
                                controller: emailController,
                                style: TextStyle(color: Colors.white),
                                keyboardType: TextInputType.emailAddress,
                                validator: emailValidator,
                                textInputAction: TextInputAction.next,
                                onFieldSubmitted: (v) =>
                                    FocusScope.of(context).nextFocus(),
                                decoration: InputDecoration(
                                  enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.white, width: 1.25)),
                                  focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.white, width: 1.25)),
                                  hintText: "Email",
                                  hintStyle: TextStyle(color: Colors.grey),
                                  prefixIcon: Icon(Icons.email,
                                      color: Colors.deepPurple[200]),
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(10.0),
                              child: TextFormField(
                                controller: passwordController,
                                obscureText: true,
                                validator: passwordValidator,
                                style: TextStyle(color: Colors.white),
                                textInputAction: TextInputAction.next,
                                onFieldSubmitted: (v) =>
                                    FocusScope.of(context).nextFocus(),
                                decoration: InputDecoration(
                                    enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.white, width: 1.25)),
                                    focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.white, width: 1.25)),
                                    hintText: "Password",
                                    hintStyle: TextStyle(color: Colors.grey),
                                    prefixIcon: Icon(Icons.lock,
                                        color: Colors.deepPurple[200])),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(10.0),
                              child: TextFormField(
                                controller: confirmPasswordController,
                                obscureText: true,
                                validator: passwordValidator,
                                style: TextStyle(color: Colors.white),
                                textInputAction: TextInputAction.done,
                                onFieldSubmitted: (v) =>
                                    FocusScope.of(context).unfocus(),
                                decoration: InputDecoration(
                                    enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.white, width: 1.25)),
                                    focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.white, width: 1.25)),
                                    hintText: "Confirm password",
                                    hintStyle: TextStyle(color: Colors.grey),
                                    prefixIcon: Icon(Icons.lock,
                                        color: Colors.deepPurple[200])),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                FadeAnimation(
                  1,
                  Container(
                    height: 50,
                    margin: EdgeInsets.symmetric(horizontal: 60),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Color.fromRGBO(49, 39, 79, 1),
                    ),
                    child: Material(
                      elevation: 5,
                      color: Color.fromRGBO(49, 39, 79, 1),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50)),
                      child: Builder(
                        builder: (context) => InkWell(
                          borderRadius: BorderRadius.circular(50),
                          onTap: () {
                            if (_registerFormKey.currentState.validate()) {
                              if (passwordController.text == confirmPasswordController.text) {
                                FirebaseAuth.instance
                                    .createUserWithEmailAndPassword(
                                        email: emailController.text,
                                        password: passwordController.text)
                                    .then(
                                      (currentUser) => Firestore.instance
                                          .collection("Patient")
                                          .document(currentUser.user.uid).collection("des").document("1")
                                          .setData({
                                        "p#": currentUser.user.uid,
                                        "firstName": firstNameController.text,
                                        "lastName": lastNameController.text,
                                        "email": emailController.text,
                                        "phoneNumber": phoneNumberController.text
                                      }).then(
                                        (result) =>
                                            Navigator.pushAndRemoveUntil(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        MainPage(currentUser.user.uid)),
                                                (route) => false),
                                      ),
                                    )
                                    .catchError((err) => print(err))
                                    .catchError((err) => print(err));
                              }
                            }
                          },
                          child: Center(
                            child: Text(
                              "Register",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
