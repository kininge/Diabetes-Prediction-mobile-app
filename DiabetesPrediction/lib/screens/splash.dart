import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class SplashScreen extends StatefulWidget
{
  @override 
  SplashScreenState createState()=> SplashScreenState();
}

class SplashScreenState extends State<SplashScreen>
{

  @override 
  Widget build(BuildContext context)
  {
    final double screenWidth= MediaQuery.of(context).size.width;

    return Scaffold
    (
      backgroundColor: Color.fromRGBO(220, 220, 220, 1.0),
      body: Container
      (
        margin: EdgeInsets.only(top: screenWidth* 0.5),
        child: Center
        (
          child: Column
          (
            children: <Widget>
            [
              logo(screenWidth),
              title(screenWidth),
            ],
          ),
        ),
      ),
    );
  }

  Widget logo(double screenWidth)
  {
    return AnimatedOpacity
    (
      opacity: 1.0,
      curve: Curves.easeIn,
      duration: Duration(seconds: 1),
      child: Container
      (
        margin: EdgeInsets.only(right: screenWidth* 0.2, left: screenWidth* 0.2),
        child: Image.asset('assets/images/diabetesPrediction.png'),
      ),
    );
  }

  Widget title(double screenWidth)
  {
    return AnimatedOpacity
    (
      opacity: 1.0,
      curve: Curves.easeIn,
      duration: Duration(seconds: 1),
      child: Container
      (
        margin: EdgeInsets.only(right: screenWidth* 0.1, left: screenWidth* 0.1),
        child: Text
        (
          'Diabetes Prediction',
          style: TextStyle
          (
            color: Colors.black,
            fontSize: 30.0,
          ),
        ),
      ),
    );
  }
}