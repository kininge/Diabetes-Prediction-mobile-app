import 'package:flutter/material.dart';

class ProjectHealthPage extends StatefulWidget
{
  @override 
  _ProjectHealthState createState()=> _ProjectHealthState();
}

class _ProjectHealthState extends State<ProjectHealthPage>
{
  @override 
  Widget build(BuildContext context)
  {
    return Scaffold
    (
      backgroundColor: Color.fromRGBO(209, 209, 209, 1.0),
      body: Center
      (
        child: Text('Project Health'),
      ),
    );
  }
}