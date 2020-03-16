import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget
{
  @override 
  _RegisterPageState createState()=> _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage>
{
  @override 
  Widget build(BuildContext context)
  {
    return Scaffold
    (
      backgroundColor: Color.fromRGBO(209, 209, 209, 1.0),
      body: Center
      (
        child: Text('Register'),
      ),
    );
  }
}