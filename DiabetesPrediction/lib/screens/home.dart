import 'package:flutter/material.dart';

class HomePage extends StatefulWidget
{
  @override 
  _HomePageState createState()=> _HomePageState();
}

class _HomePageState extends State<HomePage>
{
  @override 
  Widget build(BuildContext context)
  {
    return Scaffold
    (
      backgroundColor: Color.fromRGBO(209, 209, 209, 1.0),
      body: Center
      (
        child: Text('Home screen'),
      ),
    );
  }
}