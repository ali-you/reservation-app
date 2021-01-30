import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:reservation/MainPage.dart';
import 'package:reservation/RegisterPage.dart';
import './Animation/FadeAnimation.dart';

class LoginPage extends StatelessWidget {

  TextEditingController emailController;
  TextEditingController passwordController;
  final GlobalKey<FormState> _loginFormKey = GlobalKey<FormState>();


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
    if (value.length < 8) {
      return 'Password must be longer than 8 characters';
    } else {
      return null;
    }
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
                  Text(
                    "Hello there, \nwelcome back",
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
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
                        key: _loginFormKey,
                        child: Column(
                          children: <Widget>[

                            Container(
                              padding: EdgeInsets.all(10.0),
                              child: TextFormField(
                                controller: emailController,
                                style: TextStyle(color: Colors.white),
                                keyboardType: TextInputType.emailAddress,
                                validator: emailValidator,
                                textInputAction: TextInputAction.next,
                                onFieldSubmitted: (v) => FocusScope.of(context).nextFocus(),
                                decoration: InputDecoration(
                                  enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.white, width: 1.25)),
                                  focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.white, width: 1.25)),
                                  hintText: "Email",
                                  hintStyle: TextStyle(color: Colors.grey),
                                  prefixIcon: Icon(Icons.person_outline, color: Colors.deepPurple),
                                ),
                              ),
                            ),

                            Container(
                              padding: EdgeInsets.all(10.0),
                              child: TextFormField(
                                controller: passwordController,
                                obscureText: true ,
                                validator: passwordValidator,
                                style: TextStyle(color: Colors.white),
                                textInputAction: TextInputAction.done,
                                onFieldSubmitted: (v) => FocusScope.of(context).unfocus(),
                                decoration: InputDecoration(
                                    enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.white, width: 1.25)),
                                    focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.white, width: 1.25)),
                                    hintText: "Password",
                                    hintStyle: TextStyle(color: Colors.grey),
                                  prefixIcon: Icon(Icons.lock_outline, color: Colors.deepPurple)
                                ),
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
                Center(
                  child: FadeAnimation(
                    1,
                    Text(
                      "Forgot Password?",
                      style: TextStyle(
                        color: Colors.pink[200],
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
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
                        child: Builder(
                          builder: (context) => InkWell(
                            borderRadius: BorderRadius.circular(50),
                            onTap: (){
                              if (_loginFormKey.currentState.validate()) {
                                FirebaseAuth.instance
                                    .signInWithEmailAndPassword(
                                    email: emailController.text,
                                    password: passwordController.text)
                                    .then((value) =>
                                    Navigator.pushReplacement(
                                        context, MaterialPageRoute(
                                        builder: (context) => MainPage())));
                              }
                            },
                            child:  Center(
                              child: Text(
                                "Login",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
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
                  Center(
                    child: InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterPage()));
                      },
                      child: Text(
                        "Create Account",
                        style: TextStyle(
                          color: Colors.pink[200],
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
