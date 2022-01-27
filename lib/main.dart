import 'package:flutter/material.dart';
import 'package:gmail_login_ui/Screens/login_page.dart';
import 'package:gmail_login_ui/Screens/signup_page.dart';
import 'Screens/home.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(scaffoldBackgroundColor: const Color(0xFF3A5998)),
      debugShowCheckedModeBanner: false,
      home: LoginPage(),

    );
  }

}




