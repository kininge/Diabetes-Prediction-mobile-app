import 'package:flutter/material.dart';

class HomePage extends StatefulWidget
{
  @override 
  _HomePageState createState()=> _HomePageState();
}

class _HomePageState extends State<HomePage>
{
  Color iceBurg= Color.fromRGBO(217, 236, 242, 1.0);
  Color white= Color.fromRGBO(220, 220, 220, 1.0);
  Color black= Color.fromRGBO(33, 43, 56, 1.0);

  @override 
  Widget build(BuildContext context)
  {
    final double screenWidth= MediaQuery.of(context).size.width;

    return Scaffold
    (
      backgroundColor: white,
      body: Center
      (
        child: Text("Home screen"),
      ),
    );
  }
}