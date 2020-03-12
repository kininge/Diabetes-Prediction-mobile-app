import 'package:DiabetesPrediction/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:page_transition/page_transition.dart';

class SplashScreen extends StatefulWidget
{
  @override 
  _SplashScreenState createState()=> _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin
{
  Animation<double> fadeAnimation;
  AnimationController fadeController;
  Animation<double> scaleAnimation;
  AnimationController scaleController;

  initState()
  {
    super.initState();

    fadeController= AnimationController
    (
      duration: Duration(seconds: 2),
      vsync: this,
    )..addStatusListener((status) 
    {
      if(status== AnimationStatus.completed)
      {
        Future.delayed(Duration(seconds: 2));
        scaleController.forward();
      }
    });

    fadeAnimation= Tween(begin: 0.0, end: 1.0)
    .animate
    (
      CurvedAnimation
      (
        parent: fadeController, 
        curve: Curves.easeIn,
      ),
    );

    scaleController= AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    )..addStatusListener((status) 
    {
      if(status== AnimationStatus.completed)
      {
        Navigator.push(context, PageTransition(child: HomePage(), type: PageTransitionType.fade));
      }
    });

    scaleAnimation= Tween(begin: 1.0, end: 2000.0).animate
    (
      CurvedAnimation
      (
        parent: scaleController, 
        curve: Curves.easeInOut,
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
      body: Stack
      (
        children: <Widget>
        [
          Container
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
          AnimatedBuilder
          (
            animation: scaleAnimation,
            child: Container
            (
              height: 1.0,
              width: 1.0,
              decoration: BoxDecoration
              (
                shape: BoxShape.circle,
                color: Color.fromRGBO(126, 167, 170, 1.0),
              ),
            ),
            builder: (BuildContext context, Widget child)
            {
              return Transform.scale(
                scale: scaleAnimation.value,
                child: child,
              );
            },
          ),
        ],
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