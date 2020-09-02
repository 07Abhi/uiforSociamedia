import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              Image(
                height: MediaQuery.of(context).size.height / 2.5,
                image: AssetImage('assets/images/login_background.jpg'),
                fit: BoxFit.cover,
              )
            ],
          ),
        ),
      ),
    );
  }
}
