import 'package:flutter/material.dart';
import 'package:flutter_htpp_demo/screens/main_screen.dart';

void main()=>runApp(HttpApp());

class HttpApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(      debugShowCheckedModeBanner: false,
home:MainScreen());
  }
}