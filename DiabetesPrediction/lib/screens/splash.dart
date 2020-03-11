import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class SplashScreen extends StatefulWidget
{
  @override 
  _SplashScreenState createState()=> _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin
{
  Animation<double> fadeAnimation;
  AnimationController fadeController;

  initState()
  {
    super.initState();

    fadeController= AnimationController
    (
      duration: Duration(seconds: 5),
      vsync: this,
    );

    fadeAnimation= Tween(begin: 0.0, end: 1.0)
    .animate
    (
      CurvedAnimation
      (
        parent: fadeController, 
        curve: Curves.easeIn,
      ),
    );

    fadeController.forward();
  }

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
    return AnimatedBuilder
    (
      animation: fadeAnimation,
      child: Container
      (
        margin: EdgeInsets.only(right: screenWidth* 0.2, left: screenWidth* 0.2),
        child: Image.asset('assets/images/diabetesPrediction.png'),
      ),
      builder: (BuildContext context, Widget child) 
      {
        return FadeTransition
        (
          opacity: fadeAnimation,
          child: child
        );
      },
    );
  }

  Widget title(double screenWidth)
  {
    return AnimatedBuilder
    (
      animation: fadeAnimation,
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
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      builder: (BuildContext context, Widget child)
      {
        return FadeTransition
        (
          opacity: fadeAnimation,
          child: child,
        );
      },
    );
  }
}