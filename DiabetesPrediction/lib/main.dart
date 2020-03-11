import 'dart:ui';
import 'package:DiabetesPrediction/screens/home.dart';
import 'package:flutter/material.dart';


void main() 
{
  runApp(MyApp());
}

class MyApp extends StatelessWidget 
{
  Color amazonBlue= Color.fromRGBO(26, 166, 183, 1.0);
  Color blue= Color.fromRGBO(20, 120, 180, 1.0);
  Color white= Color.fromRGBO(220, 220, 220, 1.0);
  Color iceBurg= Color.fromRGBO(217, 236, 242, 1.0);
  Color red= Color.fromRGBO(255, 65, 77, 1.0);
  Color fentRed= Color.fromRGBO(255, 65, 77, 1.0);
  Color black= Color.fromRGBO(33, 43, 56, 1.0);
  Color gray= Color.fromRGBO(55, 70, 77, 1.0);

  @override
  Widget build(BuildContext context) 
  {
    return MaterialApp
    (
      debugShowMaterialGrid: false, //Show grid
      showPerformanceOverlay: false, //Show performance
      showSemanticsDebugger: false, //Show margin, padding
      debugShowCheckedModeBanner: false, //Degugging tag
      checkerboardOffscreenLayers: true,
      title: 'Diabetes Prediction',
      theme: ThemeData
      (
        primaryColor: amazonBlue,
      ),
      home: HomePage(),
    );
  }
}

