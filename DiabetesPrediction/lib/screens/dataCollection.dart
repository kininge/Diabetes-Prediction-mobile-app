import 'package:flutter/material.dart';

class DataCollectionPage extends StatefulWidget
{
  @override 
  _DataCollectionPageState createState()=> _DataCollectionPageState();
}

class _DataCollectionPageState extends State<DataCollectionPage>
{
  @override 
  Widget build(BuildContext context)
  {
    return SafeArea
    (
      child: Hero
      (
        tag: 'toDataCollection', 
        child: Scaffold
        (
          backgroundColor: Color.fromRGBO(209, 209, 209, 1.0),
          body: Center
          (
            child: Text('Data Collection'),
          ),
        ),
      ),
    );
  }
}