import 'dart:ui';
import 'package:DiabetesPrediction/screens/splash.dart';
import 'package:flutter/material.dart';


void main() 
{
  runApp(MyApp());
}

class MyApp extends StatelessWidget 
{

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
        primaryColor: Color.fromRGBO(43, 174, 102, 1.0),
      ),
      home: SplashScreen(),
    );
  }
}

