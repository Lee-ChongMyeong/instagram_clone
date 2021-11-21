import 'package:flutter/material.dart';
import 'package:instagram_clon/login_page.dart';
import 'package:instagram_clon/root_page.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    print('myApp craeted');
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.white,
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue).copyWith(secondary: Colors.black),
      ),
      home: LoginPage()
    );
  }
}
