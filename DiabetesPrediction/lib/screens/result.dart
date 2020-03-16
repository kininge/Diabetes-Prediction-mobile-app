import 'package:flutter/material.dart';

class ResultPage extends StatefulWidget
{
  @override 
  _ResultPageState createState()=> _ResultPageState();
}

class _ResultPageState extends State<ResultPage>
{
  @override 
  Widget build(BuildContext context)
  {
    return Scaffold
    (
      backgroundColor: Color.fromRGBO(209, 209, 209, 1.0),
      body: Center
      (
        child: Text('Result'),
      ),
    );
  }
}