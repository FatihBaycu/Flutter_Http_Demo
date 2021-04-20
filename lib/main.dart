import 'package:flutter/material.dart';
import 'package:flutter_htpp_demo/screens/MainScreen.dart';

void main()=>runApp(HttpApp());

class HttpApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home:MainScreen());
  }
}