import 'package:flutter/material.dart';
import './ui/homepage.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My Assessment',
      theme: ThemeData(primaryColor: Colors.black, backgroundColor: Colors.black),
      home: HomePage(),
    );
  }
}