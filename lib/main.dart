import 'package:flutter_social_ui/screens/loginscreen.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
 

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primaryColor: Color(0xffff084a),
          accentColor: Color(0xfffc3468),
          fontFamily: 'JosefinSans'),
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}
