import 'package:flutter/material.dart';

class LogInPage extends StatefulWidget
{
  @override 
  _LogInPageState createState()=> _LogInPageState();
}

class _LogInPageState extends State<LogInPage>
{
  @override 
  Widget build(BuildContext context)
  {
    return SafeArea
    (
      child: Hero
      (
        tag: 'toLogIn', 
        child: Scaffold
        (
          backgroundColor: Color.fromRGBO(209, 209, 209, 1.0),
          body: Center
          (
            child: Text('LogIn screen'),
          ),
        ),
      ),
    );
  }
}