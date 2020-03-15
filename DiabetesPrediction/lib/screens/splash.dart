import 'dart:async';
import 'package:DiabetesPrediction/screens/choice.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class SplashScreen extends StatefulWidget
{
  @override 
  _SplashScreenState createState()=> _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin
{
  Size screenSize;
  Animation<double> logoFadeAnimation;
  AnimationController logoFadeController;
  Animation<double> titleFadeAnimation;
  AnimationController titleFadeController;

  initState()
  {
    super.initState();

    logoFadeController= AnimationController
    (
      duration: Duration(seconds: 1),
      vsync: this,
    )..addStatusListener((status) 
    {
      if(status== AnimationStatus.completed)
      {
        Timer
        (
          Duration(seconds: 2), 
          ()
          {
            Navigator.push(context, MaterialPageRoute(builder: (context)=> Choice()));
          }
        );
      }
    });

    logoFadeAnimation= Tween(begin: 0.0, end: 1.0)
    .animate
    (
      CurvedAnimation
      (
        parent: logoFadeController, 
        curve: Curves.easeIn,
      ),
    );

    titleFadeController= AnimationController
    (
      duration: Duration(seconds: 1),
      vsync: this,
    )..addStatusListener(
      (status) 
      {
        Timer
        (
          Duration(seconds: 1), 
          ()
          {
            logoFadeController.forward();
          }
        );
        
     });

    titleFadeAnimation= Tween(begin: 0.0, end: 1.0)
    .animate
    (
      CurvedAnimation
      (
        parent: titleFadeController, 
        curve: Curves.easeIn,
      ),
    );

    titleFadeController.forward();
  }

  @override 
  Widget build(BuildContext context)
  {
    screenSize= MediaQuery.of(context).size;

    return SafeArea
    (
      child: Scaffold
      (
        body: Hero
        (
          tag: 'splashToChoice',
          child: Container
            (
              color: Color.fromRGBO(43, 174, 102, 1.0),
              child: Center
              (
                child: Column
                (
                  children: <Widget>
                  [
                    logo(),
                    title(),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
  }

  Widget logo()
  {
    return AnimatedBuilder
    (
      animation: logoFadeAnimation,
      child: Container
        (
          padding: EdgeInsets.only(top: screenSize.height* 0.33),
          child: Image.asset
          (
            'assets/images/diabetesPrediction.png',
            height: 150.0,
            width: 150.0,
          ),
        ),
      builder: (BuildContext context, Widget child) 
      {
        return FadeTransition
        (
          opacity: logoFadeAnimation,
          child: child
        );
      },
    );
  }

  Widget title()
  {
    return AnimatedBuilder
    (
      animation: titleFadeAnimation,
      child: Container
      (
        child: Text
        (
          'Diabetes Prediction',
          style: TextStyle
          (
            color: Colors.black,
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      builder: (BuildContext context, Widget child)
      {
        return FadeTransition
        (
          opacity: titleFadeAnimation,
          child: child,
        );
      },
    );
  }

  @override
  void dispose() 
  {
    super.dispose();
    logoFadeController.dispose();
    titleFadeController.dispose();
  }
}